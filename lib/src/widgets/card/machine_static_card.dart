// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '/constants.dart';
// import '../../config/grapqhql_database.dart';

// import '/src/models/count_model.dart';
// import '/src/models/machine.dart';
// import '/src/models/state_enum.dart';

// import '/src/screens/reason_screen.dart';

// import '/src/widgets/buttons/outline_button.dart';
// import '/src/widgets/label/label.dart';
// import '/src/widgets/text_field/custom_text_field.dart';
// import '/src/widgets/Cards/state_card.dart';
// import '/src/widgets/row/row_element.dart';
// import '/src/widgets/dialog_box/platform_alert_dialog.dart';

// class MachineStaticCard extends StatefulWidget {
//   final String token;
//   final bool edit;
//   final int? index;
//   final Machine machine;
//   final CountModel selectedModel;
//   MachineStaticCard({
//     required this.edit,
//     this.index,
//     required this.selectedModel,
//     required this.machine,
//     required this.token,
//   });

//   @override
//   _MachineStaticCardState createState() => _MachineStaticCardState();
// }

// class _MachineStaticCardState extends State<MachineStaticCard> {
//   final TextEditingController _editingController = TextEditingController();

//   final FocusNode _focusNode = FocusNode();

//   final String date = DateTime.now().toString().split(" ")[0];

//   String get _name => _editingController.text;
//   bool _isLoading = false;

//   void nameEditComplete() async {
//     _isLoading = true;
//     setState(() {});
//     final ApiDatabase database = Provider.of<ApiDatabase>(context, listen: false);
//     await database.updateMachine(widget.token, widget.machine.copyWith(name: _name));
//     _isLoading = false;
//     setState(() {});
//   }

//   void _showStandbyPrompt() {
//     final ApiDatabase database = Provider.of<ApiDatabase>(context, listen: false);
//     PlatformAlertDialog(
//       content: Constants.confirmStandby,
//       defaultActionText: Constants.yes,
//       cancelActionText: Constants.no,
//       actionHandler: () async {
//         // * updating machine state
//         await database
//             .updateMachine(
//                 widget.token,
//                 widget.machine.copyWith(
//                   state: machineStateEnum.Standby,
//                 ))
//             .then((value) => Navigator.pop(context));
//       },
//       title: Constants.standby,
//     ).show(context);
//   }

//   void _reasonCodePressed() {
//     Navigator.pushReplacementNamed(context, ReasonScreen.routeName,
//         arguments: ReasonScreenArguments(
//           token: widget.token,
//           machine: widget.machine,
//         ));
//   }

//   double returnHeight() {
//     final Size size = MediaQuery.of(context).size;
//     if (widget.edit) {
//       return 0.4 * size.height;
//     } else if (widget.machine.state == machineStateEnum.Standby) {
//       return 0.5 * size.height;
//     } else
//       return 0.37 * size.height;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;
//     return AnimatedContainer(
//       duration: Duration(milliseconds: 600),
//       curve: Curves.easeInOut,
//       height: returnHeight(),
//       child: Center(
//         child: !_isLoading
//             ? Column(
//                 children: [
//                   if (widget.edit)
//                     CustomTextField(
//                       controller: _editingController,
//                       focusNode: _focusNode,
//                       enabled: widget.edit,
//                       labelText: Constants.assignMachineName,
//                       onChanged: (value) => setState(() {}),
//                       onEditingComplete: nameEditComplete,
//                       suffixWidget: _name.isNotEmpty
//                           ? IconButton(
//                               icon: Icon(Icons.save),
//                               onPressed: nameEditComplete,
//                             )
//                           : null,
//                     ),
//                   if (!widget.edit)
//                     rowItem(children: <Widget>[
//                       Label(
//                         text: Constants.name,
//                         fontSize: Constants.subHeadingFontSize,
//                         weight: FontWeight.w600,
//                       ),
//                       Expanded(child: Container()),
//                       Label(
//                         text: widget.machine.name,
//                         fontSize: Constants.subHeadingFontSize,
//                         weight: FontWeight.w800,
//                       ),
//                     ]),
//                   rowItem(children: <Widget>[
//                     Label(
//                       text: Constants.count,
//                       fontSize: Constants.subHeadingFontSize,
//                       weight: FontWeight.w600,
//                     ),
//                     Label(
//                       text: widget.selectedModel.count.toString(),
//                       fontSize: Constants.subHeadingFontSize,
//                       weight: FontWeight.w800,
//                     ),
//                   ]),
//                   rowItem(children: [
//                     stateCard(
//                       context,
//                       Constants.production,
//                       widget.selectedModel.productionCount.toString(),
//                       widget.selectedModel.productionTime,
//                     ),
//                     stateCard(
//                       context,
//                       Constants.idle,
//                       widget.selectedModel.idleCount.toString(),
//                       widget.selectedModel.idleTime,
//                     ),
//                     GestureDetector(
//                       onLongPress: _showStandbyPrompt,
//                       child: stateCard(
//                         context,
//                         Constants.standby,
//                         widget.selectedModel.standbyCount.toString(),
//                         widget.selectedModel.standbyTime,
//                       ),
//                     ),
//                   ]),
//                   SizedBox(height: 0.01 * size.height),
//                   rowItem(children: <Widget>[
//                     Column(
//                       children: [
//                         Label(
//                           text: Constants.previousState,
//                           fontSize: Constants.subHeadingFontSize,
//                           weight: FontWeight.w600,
//                         ),
//                         Label(
//                           text: "L.S    " + widget.machine.previousTimeStroke,
//                           fontSize: Constants.subHeadingFontSize,
//                           weight: FontWeight.w600,
//                         ),
//                       ],
//                     ),
//                     Label(
//                       text: returnStringFromEnum(widget.machine.state)!,
//                       fontSize: Constants.subHeadingFontSize,
//                       weight: FontWeight.w800,
//                     ),
//                   ]),
//                   if (widget.machine.state == machineStateEnum.Standby)
//                     rowItem(children: <Widget>[
//                       Label(
//                         text: Constants.reasonCode,
//                         fontSize: Constants.subHeadingFontSize,
//                         weight: FontWeight.w600,
//                       ),
//                       otButton(
//                         onPressed: _reasonCodePressed,
//                         child: Label(
//                           text: widget.machine.reasonCode.toString(),
//                           fontSize: Constants.subHeadingFontSize,
//                           weight: FontWeight.w800,
//                         ),
//                       ),
//                     ]),
//                 ],
//               )
//             : CircularProgressIndicator(),
//       ),
//     );
//   }
// }
