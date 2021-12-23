// import 'package:flutter/material.dart';

// Widget baseCard(String title) {
//   double? fontSize = 14;
  

//   return Card(
//     child: Container(
//       constraints: BoxConstraints(
//         maxWidth: double.infinity,
//         minWidth: double.infinity,
//         maxHeight: height,
//         minHeight: height,
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Padding(
//             padding: EdgeInsets.only(top: padding),
//             child: headWidget(),
//           ),
//           Expanded(child: Container()),
//           Padding(
//             padding: EdgeInsets.only(bottom: padding),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 boxWithBorder(label(
//                   "${settings.temperature} °C",
//                   fontSize: fontSize,
//                 )),
//                 boxWithBorder(label(
//                   "${settings.pH} pH",
//                   fontSize: fontSize,
//                 )),
//                 boxWithBorder(label(
//                   "${settings.tds} ppm",
//                   fontSize: fontSize,
//                 )),
//                 boxWithBorder(label(
//                   "${settings.turbudity} NTU",
//                   fontSize: fontSize,
//                 )),
//               ],
//             ),
//           )
//         ],
//       ),
//     ),
//   );
// }
