// import 'package:flutter/material.dart';
// import 'package:production_automation_web/src/routes/routes.dart';
// import '/src/models/factory.dart';
// import '/src/widgets/box/sized_box.dart';
// import '/src/widgets/label/label.dart';

// class FactoryCard extends StatelessWidget {
//   final String token;
//   final FactoryModel factory;
//   const FactoryCard({Key? key, required this.factory, required this.token}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => Navigator.of(context).pushNamed(routeMachines),
//       child: Padding(
//         padding: const EdgeInsets.all(18),
//         child: Card(
//           elevation: 8,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Center(
//                   child: label(factory.factoryName),
//                 ),
//                 sizedBox(h: 20),
//                 Center(
//                   child: label(factory.factoryId),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
