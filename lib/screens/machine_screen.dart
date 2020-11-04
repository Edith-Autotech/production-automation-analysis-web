import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:production_automation_web/models/count_model.dart';
import 'package:production_automation_web/providers/database.dart';
import 'package:production_automation_web/services/api_path.dart';
import 'package:provider/provider.dart';
import '../models/factory.dart';
import '../models/machine.dart';
import '../models/strokes_model.dart';
import '../widgets/charts/strokes_chart.dart';

class MachineScreen extends StatefulWidget {
  final Machine machine;
  final FactoryModel factoryModel;
  MachineScreen({this.machine, this.factoryModel});

  @override
  _MachineScreenState createState() => _MachineScreenState();
}

class _MachineScreenState extends State<MachineScreen> {
  final FirebaseFirestore _instance = FirebaseFirestore.instance;
  final StrokesModel model = StrokesModel();
  final CountModel countModel = CountModel();
  CountModel _selectedModel;
  List<StrokesModel> data = [];
  bool _isLoading = false;
  DateTime selectedDate = DateTime.now();

  Future<void> _fetchData() async {
    final database = Provider.of<Database>(context, listen: false);
    final String dateString = selectedDate.toString().split(" ")[0];
    setState(() {
      _isLoading = true;
    });
    _instance
        .doc(ApiPath.count(
          date: dateString,
          key: widget.factoryModel.key,
          machineID: widget.machine.id,
        ))
        .snapshots()
        .forEach((element) {
      try {
        CountModel count =
            database.returnCountfromDocument(dateString, snapshot: element);
        setState(() {
          _selectedModel = count;
          _isLoading = false;
        });
      } catch (error) {
        setState(() {
          _isLoading = false;
          _selectedModel = CountModel(
            count: 0,
            date: dateString,
            idleTime: "No Data",
            productionTime: "No Data",
            standbyTime: "No Data",
          );
        });
      }
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
        title: Text(widget.machine.id),
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
                                  machine: widget.machine,
                                  factoryModel: widget.factoryModel,
                                  countModel: _selectedModel,
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
                                    label: "Name", value: widget.machine.name),
                                _rowItem(
                                    label: "Date", value: _selectedModel.date),
                                _rowItem(
                                    label: "Count",
                                    value: _selectedModel.count.toString()),
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
