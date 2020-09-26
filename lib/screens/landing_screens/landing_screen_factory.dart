import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:production_automation_web/services/api_path.dart';
import '../../models/factory.dart';
import '../../models/user.dart';
import '../../screens/register_screen.dart';
import '../../widgets/Cards/factory_card.dart';
import '../../widgets/Cards/register_factory_card.dart';

class FactoryLandingSCreen extends StatefulWidget {
  final UserModel user;
  FactoryLandingSCreen({this.user});
  @override
  _FactoryLandingSCreenState createState() => _FactoryLandingSCreenState();
}

class _FactoryLandingSCreenState extends State<FactoryLandingSCreen> {
  final FirebaseFirestore _instance = FirebaseFirestore.instance;
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Production Automation"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => RegisterScreen(
                  user: widget.user,
                ),
              ),
            ),
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _instance
            .collection(ApiPath.factories(uid: widget.user.uid))
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return snapshot.data.docs.length != 0
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 83 / 70,
                        ),
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8),
                          child: FactoryCard(
                            factory: FactoryModel(
                              key: snapshot.data.docs[index].data()["key"],
                              name: snapshot.data.docs[index].data()["name"],
                            ),
                          ),
                        ),
                      ),
                    )
                  : Center(
                      child: RegisterFactoryCard(user: widget.user),
                    );
            }
          } else if (snapshot.connectionState == ConnectionState.waiting ||
              snapshot.connectionState == ConnectionState.none ||
              snapshot.connectionState == ConnectionState.done) {
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
