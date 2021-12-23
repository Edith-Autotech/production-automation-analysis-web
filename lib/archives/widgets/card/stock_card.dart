// import 'package:flutter/material.dart';
// import 'package:production_automation_web/src/models/stock_model.dart';
// import 'package:production_automation_web/src/widgets/label/label.dart';

// class StockCard extends StatelessWidget {
//   final Stock stock;
//   const StockCard({Key? key, required this.stock}) : super(key: key);

//   Widget _rowItem({required List<Widget> children}) => Row(children: children);
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 8,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: SizedBox(
//           height: 30,
//           width: 0.15 * MediaQuery.of(context).size.width,
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 _rowItem(children: [label(stock.operationNumber.toString())]),
//                 _rowItem(children: [
//                   label("Stock"),
//                   Expanded(child: Container()),
//                   label(stock.stock.toString()),
//                 ]),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
