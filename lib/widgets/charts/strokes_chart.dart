import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:production_automation_web/models/count_model.dart';
import 'package:production_automation_web/models/machine.dart';
import "package:production_automation_web/models/factory.dart";
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
  List<StrokesModel> data = [];
  bool _isLoading = false;

  void _fetchData() {
    setState(() {
      _isLoading = true;
    });
    DocumentReference machineDocument = Firestore.instance
        .collection("factories")
        .document(widget.factoryModel.key)
        .collection("machines")
        .document(widget.machine.machineId)
        .collection("count")
        .document(widget.countModel.date);
    machineDocument
        .collection("hourly_analysis")
        .snapshots()
        .forEach((element) {
      element.documents.forEach((element) {
        print(element.documentID);
        setState(
          () => data.add(StrokesModel(
            xAxis: element.documentID,
            strokes: element.data['count'],
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
