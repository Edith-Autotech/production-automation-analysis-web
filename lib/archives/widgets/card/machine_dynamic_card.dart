// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// import '/src/models/state_enum.dart';

// import '/constants.dart';

// import '/src/models/machine.dart';
// import '/src/screens/operation_screen.dart';
// import '/src/screens/parts_search_screen.dart';

// import '/src/widgets/row/row_element.dart';
// import '/src/widgets/buttons/outline_button.dart';
// import '/src/widgets/label/label.dart';

// class MachineDynamicCard extends StatelessWidget {
//   final Machine machine;
//   final bool parallelState;
//   final String token;
//   MachineDynamicCard({
//     required this.machine,
//     required this.token,
//     required this.parallelState,
//   });

//   void onPartClick(BuildContext context) {
//     //  * navigating to parts screen
//     Navigator.pushReplacementNamed(context, PartsSearchScreen.routeName,
//         arguments: PartsScreenArguments(
//           token: token,
//           machine: machine,
//         ));
//   }

//   void onOperationClick(BuildContext context) {
//     //  * navigating to operation screen
//     Navigator.pushReplacementNamed(
//       context,
//       OperationScreen.routeName,
//       arguments: OperationScreenArguments(
//         token: token,
//         machine: machine,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 8,
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             rowItem(children: <Widget>[
//               Label(
//                 text: Constants.currentPart1,
//                 fontSize: Constants.subHeadingFontSize,
//                 weight: FontWeight.w600,
//               ),
//               otButton(
//                 onPressed: machine.state != machineStateEnum.Standby
//                     ? () => onPartClick(context)
//                     : () => Fluttertoast.showToast(
//                           msg: Constants.cannotChangePartWhenInStandby,
//                         ),
//                 child: Label(
//                   text: machine.currentPart1,
//                   fontSize: Constants.subHeadingFontSize,
//                   weight: FontWeight.w800,
//                 ),
//               ),
//             ]),
//             rowItem(children: <Widget>[
//               Label(
//                 text: Constants.currentOperation1,
//                 fontSize: Constants.subHeadingFontSize,
//                 weight: FontWeight.w600,
//               ),
//               otButton(
//                 onPressed: machine.state != machineStateEnum.Standby
//                     ? () => onOperationClick(context)
//                     : () => Fluttertoast.showToast(
//                           msg: Constants.cannotChangeOperationWhenInStandby,
//                         ),
//                 child: Label(
//                   text: machine.currentOperation1.toString(),
//                   fontSize: Constants.subHeadingFontSize,
//                   weight: FontWeight.w800,
//                 ),
//               ),
//             ]),
//             if (parallelState)
//               rowItem(children: <Widget>[
//                 Label(
//                   text: Constants.currentPart2,
//                   fontSize: Constants.subHeadingFontSize,
//                   weight: FontWeight.w600,
//                 ),
//                 otButton(
//                   onPressed: machine.state != machineStateEnum.Standby
//                       ? () => onPartClick(context)
//                       : () => Fluttertoast.showToast(
//                             msg: Constants.cannotChangePartWhenInStandby,
//                           ),
//                   child: Label(
//                     text: machine.currentPart2 == null ? Constants.na : machine.currentPart2!,
//                     fontSize: Constants.subHeadingFontSize,
//                     weight: FontWeight.w800,
//                   ),
//                 ),
//               ]),
//             if (parallelState)
//               rowItem(children: <Widget>[
//                 Label(
//                   text: Constants.currentOperation2,
//                   fontSize: Constants.subHeadingFontSize,
//                   weight: FontWeight.w600,
//                 ),
//                 otButton(
//                   onPressed: machine.state != machineStateEnum.Standby
//                       ? () => onOperationClick(context)
//                       : () => Fluttertoast.showToast(
//                             msg: Constants.cannotChangeOperationWhenInStandby,
//                           ),
//                   child: Label(
//                     text: machine.currentOperation2 == null ? Constants.na : machine.currentOperation2.toString(),
//                     fontSize: Constants.subHeadingFontSize,
//                     weight: FontWeight.w800,
//                   ),
//                 ),
//               ]),
//           ],
//         ),
//       ),
//     );
//   }
// }
