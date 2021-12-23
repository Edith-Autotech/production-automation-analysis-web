// import 'package:flutter/material.dart';

// import '/src/models/count_model.dart';
// import '/src/models/machine.dart';
// import '/src/widgets/charts/strokes_chart.dart';

// class ColumnBlock extends StatelessWidget {
//   final String token;
//   final CountModel model;
//   final bool edit;
//   final bool parallelState;
//   final Machine machine;

//   ColumnBlock({
//     Key? key,
//     required this.token,
//     required this.model,
//     required this.edit,
//     required this.machine,
//     required this.parallelState,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.all(3.0),
//           child: MachineStaticCard(
//             token: token,
//             edit: edit,
//             selectedModel: model,
//             machine: machine,
//           ),
//         ),
//         Center(
//             child: StrokesChart(
//           countModel: model,
//           machine: machine,
//         )),
//         MachineDynamicCard(
//           machine: machine,
//           token: token,
//           parallelState: parallelState,
//         ),
//       ],
//     );
//   }
// }
