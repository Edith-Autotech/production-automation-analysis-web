import 'package:flutter/material.dart';
import 'package:production_automation_web/src/widgets/label/label.dart';
import '../../models/factory.dart';
import '../../models/machine.dart';

class MachineScreen extends StatefulWidget {
  final Machine machine;
  final FactoryModel factoryModel;
  const MachineScreen({Key? key, required this.machine, required this.factoryModel}) : super(key: key);

  @override
  _MachineScreenState createState() => _MachineScreenState();
}

class _MachineScreenState extends State<MachineScreen> {
  // final FirebaseFirestore _instance = FirebaseFirestore.instance;
  // final StrokesModel model = StrokesModel();
  // final CountModel countModel = CountModel();
  // late CountModel? _selectedModel;
  // List<StrokesModel> data = [];
  // bool _isLoading = false;
  // DateTime selectedDate = DateTime.now();

  // Future<void> _fetchData() async {
  //   final ApiDatabase database = Provider.of<ApiDatabase>(context, listen: false);
  //   final String dateString = selectedDate.toString().split(" ")[0];
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   _instance
  //       .doc(ApiPath.count(
  //         date: dateString,
  //         key: widget.factoryModel.key,
  //         machineID: widget.machine.id,
  //       ))
  //       .snapshots()
  //       .forEach((element) {
  //     try {
  //       CountModel count =
  //           database.returnCountfromDocument(dateString, snapshot: element);
  //       setState(() {
  //         _selectedModel = count;
  //         _isLoading = false;
  //       });
  //     } catch (error) {
  //       setState(() {
  //         _isLoading = false;
  //         _selectedModel = CountModel(
  //           count: 0,
  //           date: dateString,
  //           idleTime: "No Data",
  //           productionTime: "No Data",
  //           standbyTime: "No Data",
  //         );
  //       });
  //     }
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   _fetchData();
  // }

  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //       context: context, initialDate: selectedDate, firstDate: DateTime(2015, 8), lastDate: DateTime(2101));
  //   if (picked != null && picked != selectedDate)
  //     setState(() {
  //       selectedDate = picked;
  //     });
  //   print("new date is " + selectedDate.toString());
  //   // _fetchData();
  // }

  // Row _rowItem({
  //   required String label,
  //   required String value,
  // }) =>
  //     Row(
  //       children: [
  //         Text(label),
  //         Expanded(child: Container()),
  //         Text(value),
  //       ],
  //     );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.machine.id),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: label("Machine data here"),
        ),

        // _selectedModel != null
        //     ? Column(
        //         mainAxisAlignment: MainAxisAlignment.start,
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Row(
        //             children: [
        //               SizedBox(
        //                 width: 0.3 * MediaQuery.of(context).size.width,
        //               ),
        //               label("Hourly Analysis"),
        //               Expanded(child: Container()),
        //               ElevatedButton(
        //                 onPressed: () => _selectDate(context),
        //                 child: label("Select date"),
        //               ),
        //             ],
        //           ),
        //           sizedBox(h: 20),
        //           Row(
        //             children: [
        //               SizedBox(
        //                 height: 0.6 * MediaQuery.of(context).size.height,
        //                 width: 0.8 * MediaQuery.of(context).size.width,
        //                 child: Center(
        //                   child: label("Charts here"),
        //                   // !_isLoading
        //                   //     ? StrokesChart(
        //                   //         machine: widget.machine,
        //                   //         factoryModel: widget.factoryModel,
        //                   //         countModel: _selectedModel,
        //                   //       )
        //                   //     : CircularProgressIndicator(),
        //                 ),
        //               ),
        //               SizedBox(
        //                 height: 0.6 * MediaQuery.of(context).size.height,
        //                 width: 0.15 * MediaQuery.of(context).size.width,
        //                 child: Center(
        //                   child: Padding(
        //                     padding: const EdgeInsets.all(8.0),
        //                     child: Column(
        //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //                       children: [
        //                         _rowItem(label: "Name", value: widget.machine.name),
        //                         _rowItem(label: "Date", value: _selectedModel.date),
        //                         _rowItem(label: "Count", value: _selectedModel.count.toString()),
        //                         _rowItem(label: "Idle Time", value: _selectedModel.idleTime),
        //                         _rowItem(label: "Standby Time", value: _selectedModel.standbyTime),
        //                         _rowItem(label: "Production Time", value: _selectedModel.productionTime),
        //                       ],
        //                     ),
        //                   ),
        //                 ),
        //               )
        //             ],
        //           ),
        //         ],
        //       )
        //     : Center(
        //         child: CircularProgressIndicator(),
        //       ),
      ),
    );
  }
}
