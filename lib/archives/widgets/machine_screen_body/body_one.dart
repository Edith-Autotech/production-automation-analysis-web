// import 'package:flutter/material.dart';
// import 'package:production_automation_web/config/grapqhql_database.dart';
// import 'package:provider/provider.dart';

// import '/src/models/count_model.dart';
// import '/src/models/machine.dart';

// // ? Body for machine one
// class BodyOne extends StatefulWidget {
//   final String token;
//   final bool? edit;
//   final DateTime dateString;
//   final Machine? machine;
//   final bool parallelState;

//   const BodyOne({Key? key, 
//     this.edit,
//     this.machine,
//     required this.dateString,
//     required this.token,
//     required this.parallelState,
//   }) : super(key: key);
//   @override
//   _BodyOneState createState() => _BodyOneState();
// }

// class _BodyOneState extends State<BodyOne> {
//   bool _isLoading = false;

//   @override
//   Widget build(BuildContext context) {
//     final ApiDatabase database = Provider.of<ApiDatabase>(context, listen: false);
//     // print(widget.dateString);
//     var dateString = widget.dateString.toString().split(" ")[0];
//     // print("Cropped dateString");
//     // print(dateString);
//     return FutureBuilder<CountModel>(
//       future: database.dailyCount(
//         widget.token,
//         dateString,
//         widget.machine!.id,
//       ),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           CountModel _localModel = snapshot.data!;
//           return RefreshIndicator(
//             onRefresh: () async {
//               _isLoading = true;
//               setState(() {});
//               _localModel = await database.dailyCount(
//                 widget.token,
//                 dateString,
//                 widget.machine!.id,
//               );
//               _isLoading = false;
//               setState(() {});
//             },
//             child: Container(
//               padding: const EdgeInsets.all(8.0),
//               child: !_isLoading
//                   ? ColumnBlock(
//                       token: widget.token,
//                       edit: widget.edit!,
//                       machine: widget.machine!,
//                       model: _localModel,
//                       parallelState: widget.parallelState,
//                     )
//                   : Center(child: CircularProgressIndicator()),
//             ),
//           );
//         } else
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//       },
//     );
//   }
// }
