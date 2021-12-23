// import 'package:flutter/material.dart';
// import 'package:production_automation_web/src/widgets/list_tile/part_tile.dart';
// import 'package:production_automation_web/src/widgets/loading_spinner/loading_spinner.dart';
// import 'package:provider/provider.dart';

// import 'package:production_automation_web/config/grapqhql_database.dart';

// import '/src/models/part.dart';

// class PartsTab extends StatelessWidget {
//   final String token;
//   final String factoryId;
//   const PartsTab({
//     Key? key,
//     required this.token,
//     required this.factoryId,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // * api provider
//     final ApiDatabase database = Provider.of<ApiDatabase>(context, listen: false);
//     return FutureBuilder<List<Part>>(
//       future: database.parts(token, factoryId),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           List<Part> partList = snapshot.data!;
//           return ListView.builder(
//             itemBuilder: (context, index) => PartTile(
//               part: partList[index],
//               // onPressed: () {
//               //   Navigator.pushNamed(context, PartScreen.routeName,
//               //       arguments: PartScreenArguments(
//               //         partList[index],
//               //         token,
//               //       ));
//               // },
//             ),
//           );
//         } else {
//           return loadingSpinner(context);
//         }
//       },
//     );
//   }
// }
