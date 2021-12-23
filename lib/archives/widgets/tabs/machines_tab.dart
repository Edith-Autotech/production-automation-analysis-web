// import 'package:flutter/material.dart';
// import 'package:production_automation_web/config/grapqhql_database.dart';
// import 'package:production_automation_web/src/models/factory.dart';
// import 'package:production_automation_web/src/widgets/card/machine_card.dart';
// import 'package:production_automation_web/src/widgets/loading_spinner/loading_spinner.dart';
// import 'package:provider/provider.dart';

// import '/src/models/machine.dart';

// class MachinesTab extends StatefulWidget {
//   final String token;
//   final FactoryModel factory;
//   const MachinesTab({
//     Key? key,
//     required this.token,
//     required this.factory,
//   }) : super(key: key);

//   @override
//   _MachinesTabState createState() => _MachinesTabState();
// }

// class _MachinesTabState extends State<MachinesTab> {
//   bool _isLoading = false;
//   @override
//   Widget build(BuildContext context) {
//     // * api provider
//     final ApiDatabase database = Provider.of<ApiDatabase>(context, listen: false);
//     return FutureBuilder<List<Machine>>(
//       future: database.machines(widget.token, widget.factory.factoryId),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           List<Machine> data = snapshot.data!;
//           data.sort((a, b) => a.name!.compareTo(b.name!));
//           return RefreshIndicator(
//             onRefresh: () async {
//               _isLoading = true;
//               setState(() {});
//               data = await database.machines(
//                 widget.token,
//                 widget.factory.factoryId,
//               );
//               _isLoading = false;
//               setState(() {});
//             },
//             child: !_isLoading
//                 ? GridView.builder(
//                     itemCount: data.length,
//                     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       childAspectRatio: 3.5 / 4.5,
//                     ),
//                     itemBuilder: (context, index) {
//                       return MachineCard(
//                         token: widget.token,
//                         machine: snapshot.data![index],
//                         factory: widget.factory,
//                       );
//                     })
//                 : loadingSpinner(context),
//           );
//           //   );
//         } else {
//           return loadingSpinner(context);
//         }
//       },
//     );
//   }
// }
