// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:production_automation_web/config/grapqhql_database.dart';
// import 'package:production_automation_web/src/models/factory.dart';
// import 'package:production_automation_web/src/models/part.dart';
// import 'package:provider/provider.dart';

// class StockBar extends StatelessWidget {
//   final FactoryModel factoryModel;
//   final Part part;
//   StockBar({
//     Key? key,
//     required this.factoryModel,
//     required this.part,
//   }) : super(key: key);

//   // final FirebaseFirestore _instance = FirebaseFirestore.instance;
//   @override
//   Widget build(BuildContext context) {
//     final ApiDatabase database = Provider.of<ApiDatabase>(context);
//     return StreamBuilder<QuerySnapshot>(
//         stream: _instance.collection(ApiPath.stock(key: factoryModel.key, partNumber: part.partNumber)).snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.active) {
//             if (snapshot.hasData) {
//               QuerySnapshot data = snapshot.data;
//               return ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: data.docs.length,
//                   itemBuilder: (context, index) {
//                     Stock part = database.returnStockFromDocument(snapshot: data.docs[index]);
//                     print("stock is " + part.stock.toString());
//                     return //Text(part.stock.toString());
//                         Padding(
//                       padding: const EdgeInsets.all(18.0),
//                       child: StockCard(
//                         stock: database.returnStockFromDocument(snapshot: data.docs[index]),
//                       ),
//                     );
//                   });
//             }
//           } else if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else
//             return Center(
//               child: Text("Check connection"),
//             );
//           return null;
//         });
//   }
// }
