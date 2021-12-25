import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:production_automation_web/config/grapqhql_database.dart';
import 'package:production_automation_web/src/routes/routes.dart';
import 'package:provider/provider.dart';

import '/src/widgets/button/submit_button.dart';
import '/src/widgets/label/label.dart';
import '/src/widgets/text_field/custom_text_field.dart';

class EmailSignInCard extends StatefulWidget {
  const EmailSignInCard({Key? key}) : super(key: key);

  @override
  _EmailSignInCardState createState() => _EmailSignInCardState();
}

enum LoginInMode {
  signInMode,
  registerMode,
}

class _EmailSignInCardState extends State<EmailSignInCard> with SingleTickerProviderStateMixin {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();

  String get email => _emailController.text;
  String get password => _passwordController.text;

  void signIn() async {
    // print("sign in");
    final ApiDatabase database = Provider.of<ApiDatabase>(context, listen: false);
    try {
      var response = await database.login(email, password);
      // print(response);

      await _storage.write(key: "jwt", value: response);

      Navigator.pushNamed(context, routeMachines);
    } catch (error) {
      print(error);
      Fluttertoast.showToast(msg: error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        color: Colors.grey[700],
        child: Container(
          height: 600,
          padding: const EdgeInsets.all(50.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: label(
                    "Sign In",
                    fontSize: 25,
                    textColor: Colors.grey[300],
                  ),
                ),
                CustomTextField(
                  controller: _emailController,
                  focusNode: _emailNode,
                  labelText: "Email",
                  hintText: "abc@xyz.com",
                  enabled: true,
                  onChanged: (value) => setState(() {}),
                  onEditingComplete: () {},
                ),
                CustomTextField(
                  controller: _passwordController,
                  focusNode: _passwordNode,
                  labelText: "Password",
                  obscureText: true,
                  enabled: true,
                  onChanged: (value) => setState(() {}),
                  onEditingComplete: signIn,
                ),
                SubmitButton(
                  color: Theme.of(context).colorScheme.secondary,
                  text: "Sign In",
                  onPressed: signIn,
                ),
              ],
            ),
          ),
        ),
        elevation: 9,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
