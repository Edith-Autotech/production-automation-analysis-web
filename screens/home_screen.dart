import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:production_automation_web/models/factory.dart';
import 'package:production_automation_web/models/machine.dart';
import 'package:production_automation_web/models/user.dart';
import 'package:production_automation_web/providers/auth.dart';
import 'package:production_automation_web/widgets/Cards/machine_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  final User user;
  final Factory factory;
  HomeScreen({this.user, this.factory});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  void signOut() async {
    final auth = Provider.of<AuthBase>(context, listen: false);
    await auth.signOut();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Machines"),
        actions: [
          FlatButton(
            child: Text(
              "Sign out",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: signOut,
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection("factories")
            .document(widget.factory.key)
            .collection("machines")
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              QuerySnapshot data = snapshot.data;
              return Padding(
                padding: const EdgeInsets.all(18.0),
                child: GridView.builder(
                  itemCount: data.documents.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 150 / 90,
                  ),
                  itemBuilder: (context, index) {
                    return MachineCard(
                      factory: widget.factory,
                      machine: Machine(
                        machineId: snapshot.data.documents[index].documentID,
                        currentOperation: snapshot.data.documents[index]
                            .data["working_operation_number"],
                        currentPart: snapshot
                            .data.documents[index].data["working_part_number"],
                      ),
                    );
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
      ),
    );
  }
}
