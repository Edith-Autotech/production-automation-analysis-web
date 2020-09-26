import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:production_automation_web/models/count_model.dart';
import 'package:production_automation_web/models/machine.dart';
import "package:production_automation_web/models/factory.dart";
import 'package:production_automation_web/services/api_path.dart';
import '../../models/strokes_model.dart';

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
  bool _isLoading = false;
  void _fetchData() {
    setState(() {
      _isLoading = true;
    });
    print("Count is " + widget.countModel.count.toString());
    print(widget.countModel.date);
    _instance
        .collection(ApiPath.hourlyAnalysis(
            key: widget.factoryModel.key,
            machineID: widget.machine.machineId,
            dateString: widget.countModel.date))
        .snapshots()
        .forEach((element) {
      element.docs.forEach((element) {
        print(element.id);
        setState(
          () => data.add(StrokesModel(
            xAxis: element.id,
            strokes: element.data()['count'],
          )),
        );
      });
    });
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    List<charts.Series<StrokesModel, String>> series = [
      charts.Series(
        id: "Strokes",
        data: data,
        domainFn: (StrokesModel model, _) => model.xAxis.toString(),
        measureFn: (StrokesModel model, _) => model.strokes,
        // colorFn: (StrokesModel model, _) => model.barColor,
      )
    ];
    return Container(
      child: Center(
        child: !_isLoading
            ? charts.BarChart(
                series,
                animate: true,
              ) //Text(widget.countModel.count.toString())
            : CircularProgressIndicator(),
      ),
    );
  }
}
