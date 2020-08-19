import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:production_automation_web/providers/auth.dart';
import 'package:production_automation_web/widgets/dialog_box/platform_alert_dialog.dart';
import 'package:provider/provider.dart';
import '../../widgets/buttons/submit_button.dart';
import '../../widgets/text_field/custom_text_field.dart';

class EmailSignInCard extends StatefulWidget {
  @override
  _EmailSignInCardState createState() => _EmailSignInCardState();
}

enum LoginInMode {
  SignInMode,
  RegisterMode,
}

class _EmailSignInCardState extends State<EmailSignInCard>
    with SingleTickerProviderStateMixin {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  final FocusNode _confirmPasswordNode = FocusNode();

  String get email => _emailController.text;
  String get password => _passwordController.text;
  String get confirmPassword => _confirmPasswordController.text;

  LoginInMode _loginInMode = LoginInMode.SignInMode;
  AnimationController _controller;
  Animation<Size> _heightAnimation;
  bool _isSwitched = true;

  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _heightAnimation = Tween<Size>(
            begin: Size(double.infinity, 300), end: Size(double.infinity, 400))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
  }

  void changeState(bool value) {
    if (value == true) {
      setState(() {
        _isSwitched = value;
        _loginInMode = LoginInMode.SignInMode;
      });
      _controller.forward();
    } else {
      setState(() {
        _isSwitched = value;
        _loginInMode = LoginInMode.RegisterMode;
      });
      _controller.reverse();
    }
  }

  void signIn() async {
    print("sign in");
    final auth = Provider.of<Auth>(context, listen: false);
    await auth.signInWithEmailAndPassword(email, password);
  }

  void register() async {
    print("register");

    final auth = Provider.of<Auth>(context, listen: false);
    if (password == confirmPassword) {
      try {
        await auth.createUserWithEmailAndPassword(email, password);
      } on PlatformException catch (error) {
        PlatformAlertDialog(
          content: error.message,
          defaultActionText: "Okay",
          title: "Error!",
        );
      }
    } else {
      FlutterToast(context).showToast(child: Text("Passwords don't match"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: AnimatedBuilder(
            animation: _heightAnimation,
            builder: (context, child) => Container(
              height: _heightAnimation.value.height,
              width: _heightAnimation.value.width,
              constraints: BoxConstraints(
                minHeight: _heightAnimation.value.height,
              ),
              child: child,
            ),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Register",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Switch(
                          value: _isSwitched,
                          inactiveTrackColor: Colors.red,
                          onChanged: (value) => changeState(value),
                        ),
                        Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: 20,
                          ),
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
                  if (_loginInMode == LoginInMode.RegisterMode)
                    CustomTextField(
                      controller: _confirmPasswordController,
                      focusNode: _confirmPasswordNode,
                      onChanged: (value) => setState(() {}),
                      onEditingComplete: () {},
                      enabled: _loginInMode == LoginInMode.RegisterMode,
                      labelText: 'Confirm Password',
                      obscureText: true,
                    ),
                  SubmitButton(
                    color: _loginInMode == LoginInMode.SignInMode
                        ? Theme.of(context).accentColor
                        : Colors.red,
                    text: _loginInMode == LoginInMode.SignInMode
                        ? "Sign In"
                        : "Register",
                    onPressed: _loginInMode == LoginInMode.SignInMode
                        ? signIn
                        : register,
                  ),
                ],
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