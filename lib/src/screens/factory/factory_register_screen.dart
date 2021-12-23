import 'package:flutter/material.dart';

import '/src/widgets/app_bar/default_app_bar.dart';
import '/src/models/user.dart';
import 'components/register_factory_card.dart';

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
