
import 'package:flutter/material.dart';
import 'package:production_automation_web/models/factory.dart';
import 'package:production_automation_web/models/user.dart';
import 'package:production_automation_web/screens/home_screen.dart';

class FactoryCard extends StatelessWidget {
  final UserModel user;
  final FactoryModel factory;
  FactoryCard({@required this.factory, this.user});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => HomeScreen(
              user: user,
              factory: factory,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    factory.name,
                    style: TextStyle(fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    factory.key,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
