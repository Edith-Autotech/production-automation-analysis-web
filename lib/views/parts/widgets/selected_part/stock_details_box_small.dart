// import 'package:flutter/material.dart';

// import '/constants/style.dart';

// import '/widgets/custom_text.dart';

// class StockDetailsBoxSmall extends StatelessWidget {
//   final String operationString;
//   final int count;
//   const StockDetailsBoxSmall({
//     Key? key,
//     required this.operationString,
//     required this.count,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 60,
//       margin: const EdgeInsets.all(10),
//       padding: const EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(6),
//         border: Border.all(
//           width: 1.5,
//           color: light.withOpacity(0.6),
//         ),
//       ),
//       child: Column(
//         children: [
//           Flexible(
//             child: CustomText(
//               text: operationString,
//               color: light.withOpacity(0.7),
//               weight: FontWeight.w500,
//             ),
//           ),
//           Flexible(
//             child: CustomText(
//               text: count.toString(),
//               color: light.withOpacity(0.8),
//               weight: FontWeight.w700,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
