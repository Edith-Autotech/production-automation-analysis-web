import 'package:flutter/material.dart';

import '/constants/controllers.dart';
import '/constants/style.dart';

import '/models/user.dart';

import '/widgets/custom_text_field.dart';

import '../base_settings_page_layout.dart';
import '../../widgets/submit_button.dart';
import '../../widgets/row_element.dart';
import '../../widgets/drop_down_button.dart';

class SettingsAddUser extends StatefulWidget {
  const SettingsAddUser({Key? key}) : super(key: key);

  @override
  State<SettingsAddUser> createState() => _SettingsAddUserState();
}

class _SettingsAddUserState extends State<SettingsAddUser> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _nameFocusNode = FocusNode();

  String get _email => _emailController.text;
  String get _password => _passwordController.text;
  String get _name => _nameController.text;

  bool get showSubmitBtn => _email.isNotEmpty && _password.isNotEmpty && _name.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return BaseSettingsPageLayout(
      child: Container(
        margin: const EdgeInsets.all(defaultPadding),
        padding: const EdgeInsets.all(defaultPadding),
        height: _height * 0.8,
        child: Column(
          children: [
            rowElement(
              "Name",
              CustomTextField(
                controller: _nameController,
                focusNode: _nameFocusNode,
                onChanged: (value) => setState(() {}),
                hintText: "John Wick",
                onEditingComplete: () {},
              ),
            ),
            const SizedBox(height: defaultPadding),
            rowElement(
              "Email",
              CustomTextField(
                controller: _emailController,
                focusNode: _emailFocusNode,
                onChanged: (value) => setState(() {}),
                hintText: "admin@paa.com",
                onEditingComplete: () {},
              ),
            ),
            const SizedBox(height: defaultPadding),
            rowElement(
              "Password",
              CustomTextField(
                controller: _passwordController,
                focusNode: _passwordFocusNode,
                onChanged: (value) => setState(() {}),
                hintText: "123",
                obscureText: true,
                onEditingComplete: () {},
              ),
            ),
            const SizedBox(height: defaultPadding),
            rowElement(
              "Assign role",
              showUserRolesDropdown(
                UserModel(
                  email: _email,
                  factoryId: userController.activeUser.value.factoryId,
                  name: _name,
                ),
              ),
            ),
            const SizedBox(height: defaultPadding),
            if (showSubmitBtn) SubmitButton(onPressed: () {})
          ],
        ),
      ),
    );
  }
}
