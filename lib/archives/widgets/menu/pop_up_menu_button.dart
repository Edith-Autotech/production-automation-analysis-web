// import 'package:flutter/material.dart';

// import '/src/widgets/buttons/icon_button.dart';
// import '/src/widgets/row/row_element.dart';
// import '/constants.dart';

// PopupMenuButton popUpMenu({
//   required String dateString,
//   required VoidCallback onCalanderPressed,
//   required IconData editIconData,
//   required VoidCallback onEditPressed,
//   required bool parallelStateValue,
//   required Function(bool) onParallelPressed,
// }) {
//   return PopupMenuButton<Widget>(
//     shape: const RoundedRectangleBorder(
//       borderRadius: BorderRadius.all(
//         Radius.circular(15),
//       ),
//       side: BorderSide(
//         width: 3,
//       ),
//     ),
//     icon: const Icon(Icons.settings, color: Colors.white),
//     itemBuilder: (BuildContext context) => [
//       PopupMenuItem(
//         child: rowItem(
//           children: [
//             Text(dateString),
//             customIconButton(onCalanderPressed, Icons.calendar_today),
//           ],
//         ),
//       ),
//       PopupMenuItem(
//         child: rowItem(
//           children: [const Text(Constants.edit), customIconButton(onEditPressed, editIconData)],
//         ),
//       ),
//       PopupMenuItem(
//         child: rowItem(
//           children: [
//             const Text(Constants.parallelState),
//             Switch(
//               value: parallelStateValue, // ,
//               activeColor: Colors.white,
//               inactiveTrackColor: Colors.red,
//               activeTrackColor: Colors.green,
//               onChanged: onParallelPressed,
//             ),
//           ],
//         ),
//       ),
//     ],
//   );
// }
