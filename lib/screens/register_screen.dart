import 'package:flutter/material.dart';
import '../models/user.dart';
import '../widgets/Cards/register_factory_card.dart';

class RegisterScreen extends StatelessWidget {
  final UserModel user;
  RegisterScreen({this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Factory"),
      ),
      body: Center(child: RegisterFactoryCard(user: user)),
    );
  }
}
