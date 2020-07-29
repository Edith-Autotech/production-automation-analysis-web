import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../models/factory.dart';
import '../models/machine.dart';
import '../models/strokes_model.dart';
import '../widgets/charts/strokes_chart.dart';

class AnalysisScreen extends StatefulWidget {
  final Machine machine;
  final Factory factory;
  AnalysisScreen({this.machine, this.factory});

  @override
  _AnalysisScreenState createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> {
  final List<StrokesModel> data = [
    StrokesModel(
      hour: "10-11",
      strokes: 100,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    StrokesModel(
      hour: "11-12",
      strokes: 200,
      barColor: charts.ColorUtil.fromDartColor(Colors.yellow),
    ),
    StrokesModel(
      hour: "12-13",
      strokes: 150,
      barColor: charts.ColorUtil.fromDartColor(Colors.red),
    ),
    StrokesModel(
      hour: "13-14",
      strokes: 400,
      barColor: charts.ColorUtil.fromDartColor(Colors.pink),
    ),
    StrokesModel(
      hour: "14-15",
      strokes: 100,
      barColor: charts.ColorUtil.fromDartColor(Colors.lime),
    ),
  ];
  DateTime selectedTime = DateTime.now();

  Future<void> _fetchData() async {
    Firestore.instance
        .collection("factories")
        .document(widget.factory.key)
        .collection("machines")
        .document(widget.machine.machineId)
        .collection("count")
        .document("2020-06-09")
        .collection("hourly_analysis")
        .snapshots()
        .forEach((event) {
      event.documents.forEach((element) {
        data.add(StrokesModel().fromDocumentSnapshot(snapshot: element));
        print(element.documentID);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedTime,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedTime)
      setState(() {
        selectedTime = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.machine.machineId),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                Text("${selectedTime.toLocal()}".split(" ")[0]),
                SizedBox(width: 20),
                RaisedButton(
                  onPressed: () => _selectDate(context),
                  child: Text("Select date"),
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: StrokesChart(
                  data: data,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
