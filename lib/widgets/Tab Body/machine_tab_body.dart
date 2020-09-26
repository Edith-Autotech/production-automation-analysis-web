import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:production_automation_web/models/factory.dart';
import 'package:production_automation_web/providers/database.dart';
import 'package:production_automation_web/services/api_path.dart';
import 'package:production_automation_web/widgets/Cards/machine_card.dart';
import 'package:provider/provider.dart';

class MachineTabBody extends StatelessWidget {
  final FactoryModel factoryModel;
  MachineTabBody({this.factoryModel});

  final FirebaseFirestore _instance = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);
    return StreamBuilder<QuerySnapshot>(
      stream: _instance
          .collection(ApiPath.machines(key: factoryModel.key))
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            QuerySnapshot data = snapshot.data;
            return Padding(
              padding: const EdgeInsets.all(18.0),
              child: GridView.builder(
                itemCount: data.docs.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 150 / 90,
                ),
                itemBuilder: (context, index) {
                  return MachineCard(
                      factory: factoryModel,
                      machine: database.returnMachineFromDocument(
                          snapshot: snapshot.data.docs[index]));
                },
              ),
            );
          }
        } else if (snapshot.connectionState == ConnectionState.done ||
            snapshot.connectionState == ConnectionState.waiting ||
            snapshot.connectionState == ConnectionState.none) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return null;
      },
    );
  }
}
