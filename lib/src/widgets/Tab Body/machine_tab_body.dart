import 'package:flutter/material.dart';
// import 'package:production_automation_web/config/grapqhql_database.dart';
import 'package:production_automation_web/src/models/factory.dart';
// import 'package:production_automation_web/src/models/machine.dart';
// import 'package:provider/provider.dart';

class MachineTabBody extends StatelessWidget {
  final FactoryModel factoryModel;
  const MachineTabBody({Key? key, required this.factoryModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final ApiDatabase database = Provider.of<ApiDatabase>(context);
    return Container();

    // StreamBuilder<List<Machine>>(
    //     stream: database.getMachines(factoryModel: factoryModel),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.active) {
    //         if (snapshot.hasData) {
    //           List<Machine> data = snapshot.data;
    //           data.sort((a, b) => a.name.compareTo(b.name));
    //           return GridView.builder(
    //               itemCount: data.length,
    //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //                 crossAxisCount: 4,
    //                 childAspectRatio: 150 / 90,
    //               ),
    //               itemBuilder: (context, index) {
    //                 return MachineCard(
    //                   factory: factoryModel,
    //                   machine: snapshot.data[index],
    //                 );
    //               });
    //         }
    //       } else if (snapshot.connectionState == ConnectionState.done ||
    //         snapshot.connectionState == ConnectionState.waiting ||
    //         snapshot.connectionState == ConnectionState.none) {
    //       return Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     }
    //     return null;
    //   },
    // );
  }
}
