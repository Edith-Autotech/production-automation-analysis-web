import 'package:flutter/material.dart';
import 'package:production_automation_web/src/widgets/label/label.dart';
import '../../widgets/buttons/submit_button.dart';
import '../../widgets/text_field/custom_text_field.dart';

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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  final FocusNode _confirmPasswordNode = FocusNode();

  String get email => _emailController.text;
  String get password => _passwordController.text;
  String get confirmPassword => _confirmPasswordController.text;

  LoginInMode _loginInMode = LoginInMode.signInMode;
  bool _isSwitched = true;

  // @override
  // void initState() {
  //   super.initState();
  // }

  void changeState(bool value) {
    if (value == true) {
      setState(() {
        _isSwitched = value;
        _loginInMode = LoginInMode.signInMode;
      });
    } else {
      setState(() {
        _isSwitched = value;
        _loginInMode = LoginInMode.registerMode;
      });
    }
  }

  // void signIn() async {
  //   print("sign in");
  //   final auth = Provider.of<Auth>(context, listen: false);
  //   await auth.signInWithEmailAndPassword(email, password);
  // }

  // void register() async {
  //   print("register");

  //   final auth = Provider.of<Auth>(context, listen: false);
  //   if (password == confirmPassword) {
  //     try {
  //       await auth.createUserWithEmailAndPassword(email, password);
  //     } catch (error) {
  //       CoolAlert.show(
  //           context: context,
  //           type: CoolAlertType.error,
  //           text: "User not found",
  //           title: "User Error");
  //     }
  //   } else {
  //     FlutterToast(context).showToast(child: label("Passwords don't match"));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        child: Container(
          height: 500,
          padding: const EdgeInsets.all(50.0),
          child: Center(
            child: Form(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                height: _loginInMode == LoginInMode.registerMode ? 400 : 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          label(
                            "Register",
                          ),
                          Switch(
                            value: _isSwitched,
                            inactiveTrackColor: Colors.red,
                            onChanged: (value) => changeState(value),
                          ),
                          label(
                            "Sign In",
                          ),
                        ],
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
                      onEditingComplete: () {},
                    ),
                    if (_loginInMode == LoginInMode.registerMode)
                      CustomTextField(
                        controller: _confirmPasswordController,
                        focusNode: _confirmPasswordNode,
                        onChanged: (value) => setState(() {}),
                        onEditingComplete: () {},
                        enabled: _loginInMode == LoginInMode.registerMode,
                        labelText: 'Confirm Password',
                        obscureText: true,
                      ),
                    SubmitButton(
                      color: _loginInMode == LoginInMode.signInMode ? Theme.of(context).colorScheme.secondary : Colors.red,
                      text: _loginInMode == LoginInMode.signInMode ? "Sign In" : "Register",
                      onPressed: () {},

                      //  _loginInMode == LoginInMode.signInMode ? signIn : register,
                    ),
                  ],
                ),
              ),
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
