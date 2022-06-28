import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:production_automation_web/constants/controllers.dart';
import 'package:production_automation_web/widgets/custom_text_field.dart';

import '/constants/style.dart';
import '/widgets/custom_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  String get _email => _emailController.text;
  String get _password => _passwordController.text;

  onEmailEditingComplete() {
    if (_email.isNotEmpty) {
      _passwordFocusNode.requestFocus();
    } else {
      _emailFocusNode.requestFocus();
    }
  }

  onPasswordEditingComplete() async {
    if (_password.isNotEmpty) {
      try {
        await userController.login(_email, _password);
      } catch (error) {
        Fluttertoast.showToast(msg: error.toString());
      }
    } else {
      Fluttertoast.showToast(msg: "Password cannot be empty");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 12),
                  child: Icon(Icons.ac_unit),
                ),
                Expanded(child: Container())
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text(
                  "Login",
                  style: GoogleFonts.roboto(fontSize: 30, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Row(
              children: const [
                CustomText(
                  "Welcome back to the admin panel",
                  color: lightGrey,
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextField(
              controller: _emailController,
              focusNode: _emailFocusNode,
              labelText: "Email",
              hintText: "abc@paa.com",
              onChanged: (value) => setState(() {}),
              onEditingComplete: onEmailEditingComplete,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextField(
              controller: _passwordController,
              focusNode: _passwordFocusNode,
              labelText: "Password",
              hintText: "123",
              onChanged: (value) => setState(() {}),
              onEditingComplete: onPasswordEditingComplete,
              obscureText: true,
            ),
            const SizedBox(height: defaultPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const CustomText("Remember Me"),
                  ],
                ),
                const CustomText(
                  "Forgot password",
                  color: active,
                )
              ],
            ),
            const SizedBox(height: defaultPadding),
            InkWell(
              onTap: onPasswordEditingComplete,
              child: Container(
                decoration: BoxDecoration(
                  color: active,
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: const CustomText(
                  "Login",
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            RichText(
                text: const TextSpan(children: [
              TextSpan(text: "Do not have admin credentials? "),
              TextSpan(
                text: "Request credentials!",
                style: TextStyle(color: active),
              ),
            ]))
          ],
        ),
      )),
    );
  }
}
