import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:production_automation_web/models/count_model.dart';
import 'package:production_automation_web/models/factory.dart';
import 'package:production_automation_web/models/machine.dart';
import 'package:production_automation_web/models/strokes_model.dart';
import 'package:production_automation_web/services/api_path.dart';

class StrokesChart extends StatefulWidget {
  final CountModel countModel;
  final Machine machine;
  final FactoryModel factoryModel;

  StrokesChart({
    Key key,
    @required this.countModel,
    @required this.factoryModel,
    @required this.machine,
  }) : super(key: key);

  @override
  _StrokesChartState createState() => _StrokesChartState();
}

class _StrokesChartState extends State<StrokesChart> {
  final FirebaseFirestore _instance = FirebaseFirestore.instance;
  List<StrokesModel> data = [];
  List<StrokesModel> filteredData = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() {
    if (mounted)
      setState(() {
        _isLoading = true;
      });
    _instance
        .collection(ApiPath.hourlyAnalysis(
            key: widget.factoryModel.key,
            machineID: widget.machine.id,
            dateString: widget.countModel.date))
        .snapshots()
        .forEach((snapshot) {
      snapshot.docs.forEach((document) {
        if (data.length > snapshot.docs.length - 1) {
          data.clear();
          filteredData.clear();
        }
        if (mounted)
          setState(
            () => data.add(StrokesModel(
              xAxis: document.id,
              strokes: document.data()['count'],
            )),
          );
      });
    });
    if (mounted)
      setState(() {
        _isLoading = false;
      });
  }

  void fetchCorrectedList() => data.forEach((element) {
        var i = data.indexOf(element);
        if (i == 0) {
          setState(() {
            filteredData.add(
                StrokesModel(strokes: element.strokes, xAxis: element.xAxis));
          });
        } else {
          setState(() {
            filteredData.add(StrokesModel(
                strokes: element.strokes - data[i - 1].strokes,
                xAxis: element.xAxis));
          });
        }
      });

  @override
  Widget build(BuildContext context) {
    fetchCorrectedList();
    List<charts.Series<StrokesModel, String>> series = [
      charts.Series(
        id: "Strokes",
        data: filteredData,
        domainFn: (StrokesModel model, _) => model.xAxis.toString(),
        measureFn: (StrokesModel model, _) => model.strokes,
      )
    ];
    return Container(
      child: Center(
        child: !_isLoading
            ? charts.BarChart(
                series,
                animate: true,
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}
