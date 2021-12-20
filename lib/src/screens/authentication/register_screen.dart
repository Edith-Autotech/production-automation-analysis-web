import 'package:flutter/material.dart';
import 'package:production_automation_web/src/widgets/app_bar/default_app_bar.dart';
import 'package:production_automation_web/src/widgets/card/register_factory_card.dart';
import '../../models/user.dart';

class RegisterScreen extends StatelessWidget {
  final UserModel user;
  const RegisterScreen({Key? key, required this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context, text: "Add Factory"),
      body: Center(child: RegisterFactoryCard(user: user)),
    );
  }
}
