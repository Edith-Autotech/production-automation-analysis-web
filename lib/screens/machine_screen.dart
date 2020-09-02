import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:production_automation_web/models/count_model.dart';
import '../models/factory.dart';
import '../models/machine.dart';
import '../models/strokes_model.dart';
import '../widgets/charts/strokes_chart.dart';

class MachineScreen extends StatefulWidget {
  final Machine machine;
  final Factory factory;
  MachineScreen({this.machine, this.factory});

  @override
  _MachineScreenState createState() => _MachineScreenState();
}

class _MachineScreenState extends State<MachineScreen> {
  final StrokesModel model = StrokesModel();
  final CountModel countModel = CountModel();
  CountModel _selectedModel;
  List<StrokesModel> data = [];
  bool _isLoading = false;
  DateTime selectedDate = DateTime.now();

  Future<void> _fetchData() async {
    setState(() {
      _isLoading = true;
    });
    print(selectedDate);
    DocumentReference machineDocument = Firestore.instance
        .collection("factories")
        .document(widget.factory.key)
        .collection("machines")
        .document(widget.machine.machineId)
        .collection("count")
        .document(selectedDate.toString().split(" ")[0]);

    DocumentSnapshot doc = await machineDocument.get();
    CountModel count = countModel.fromDocumentSnapshot(
        selectedDate.toString().split(" ")[0],
        snapshot: doc);
    setState(() {
      _selectedModel = count;
      _isLoading = false;
    });
    print("Selected value is " + _selectedModel.standbyTime.toString());
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
    print("new date is " + selectedDate.toString());
    _fetchData();
  }

  Row _rowItem({String label, String value}) => Row(
        children: [
          Text(label),
          Expanded(child: Container()),
          Text(value),
        ],
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.machine.machineId),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: _selectedModel != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 0.3 * MediaQuery.of(context).size.width,
                      ),
                      Text(
                        "Hourly Analysis",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Expanded(child: Container()),
                      RaisedButton(
                        onPressed: () => _selectDate(context),
                        child: Text("Select date"),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      SizedBox(
                        height: 0.6 * MediaQuery.of(context).size.height,
                        width: 0.8 * MediaQuery.of(context).size.width,
                        child: Center(
                          child: !_isLoading
                              ? StrokesChart(
                                  data: data,
                                )
                              : CircularProgressIndicator(),
                        ),
                      ),
                      SizedBox(
                        height: 0.6 * MediaQuery.of(context).size.height,
                        width: 0.15 * MediaQuery.of(context).size.width,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _rowItem(
                                    label: "Date", value: _selectedModel.date),
                                _rowItem(
                                    label: "Idle Time",
                                    value: _selectedModel.idleTime),
                                _rowItem(
                                    label: "Standby Time",
                                    value: _selectedModel.standbyTime),
                                _rowItem(
                                    label: "Production Time",
                                    value: _selectedModel.productionTime),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
