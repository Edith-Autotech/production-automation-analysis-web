import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:production_automation_web/providers/database.dart';
import 'package:production_automation_web/services/api_path.dart';
import 'package:provider/provider.dart';
import '../../models/factory.dart';
import '../../models/user.dart';
import '../../screens/register_screen.dart';
import '../../widgets/Cards/factory_card.dart';
import '../../widgets/Cards/register_factory_card.dart';

class FactoryLandingSCreen extends StatefulWidget {
  final UserModel user;
  FactoryLandingSCreen({@required this.user});
  @override
  _FactoryLandingSCreenState createState() => _FactoryLandingSCreenState();
}

class _FactoryLandingSCreenState extends State<FactoryLandingSCreen> {
  final FirebaseFirestore _instance = FirebaseFirestore.instance;
  String adminStatus;
  String companyName;

  void initState() {
    super.initState();
    getAdminStatus();
  }

  void getAdminStatus() async {
    try {
      DocumentSnapshot doc =
          await _instance.doc(ApiPath.userDoc(uid: widget.user.uid)).get();
      var admin = doc.data()['admin'];
      var companyNameLocal = doc.data()['companyName'];
      setState(() {
        adminStatus = admin;
        companyName = companyNameLocal;
      });
    } catch (exception) {
      print(exception);
      setState(() {
        adminStatus = "false";
        companyName = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Production Automation"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => RegisterScreen(
                  user: UserModel(
                    uid: widget.user.uid,
                    admin: adminStatus,
                    email: widget.user.email,
                    imageUrl: widget.user.imageUrl,
                    name: widget.user.name,
                    comapanyName: companyName,
                  ),
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
                            user: UserModel(
                              uid: widget.user.uid,
                              admin: adminStatus,
                              email: widget.user.email,
                              imageUrl: widget.user.imageUrl,
                              name: widget.user.name,
                              comapanyName: companyName,
                            ),
                            factory: database.returnFactoryFromDocument(
                                snapshot: snapshot.data.docs[index]),
                          ),
                        ),
                      ),
                    )
                  : Center(
                      child: RegisterFactoryCard(
                        user: UserModel(
                          uid: widget.user.uid,
                          admin: adminStatus,
                          email: widget.user.email,
                          imageUrl: widget.user.imageUrl,
                          name: widget.user.name,
                          comapanyName: companyName,
                        ),
                      ),
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
