import 'package:flutter/material.dart';
import 'package:production_automation_web/src/widgets/Validators/validators.dart';
import 'package:production_automation_web/src/widgets/box/sized_box.dart';
import 'package:production_automation_web/src/widgets/buttons/submit_button.dart';
import 'package:production_automation_web/src/widgets/text_field/custom_text_field.dart';

class ForgotPasswordForm extends StatefulWidget with Validators {
  ForgotPasswordForm({Key? key}) : super(key: key);

  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  // String get _email => _emailController.text;
  // bool _submitted = false;
  // ignore: prefer_final_fields
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _buildChildren(),
    );
  }

  Widget _buildChildren() {
    final Size size = MediaQuery.of(context).size;
    final ThemeData theme = Theme.of(context);
    // bool submitEnabled = widget.emailValidator.isValid(_email) && !_isLoading;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        sizedBox(h: 0.03 * size.height),
        Image.asset(
          "assets/ForgetPassword/drawable-hdpi/password.png",
          scale: 1,
        ),
        sizedBox(h: 0.03 * size.height),
        Text("Enter Email Address",
            textAlign: TextAlign.left, style: theme.textTheme.headline3),
        sizedBox(h: 0.03 * size.height),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: _buildEmailTextField(),
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: SubmitButton(
            text: 'Submit', color: theme.colorScheme.secondary,
            onPressed: () {}, // submitEnabled ? _submit : null,
          ),
        ),
        sizedBox(h: 0.05 * size.height),
      ],
    );
  }

  CustomTextField _buildEmailTextField() {
    // bool showErrorText = _submitted && !widget.emailValidator.isValid(_email);
    return CustomTextField(
      controller: _emailController,
      focusNode: _emailFocusNode,
      autoFocus: true,
      labelText: 'Email Address',
      hintText: 'john@ea.com',
      errorText: "showErrorText", // ? widget.invalidEmailError : null,
      enabled: _isLoading == false,
      inputType: TextInputType.emailAddress,
      inputAction: TextInputAction.next,
      onChanged: (email) => _updateState(),
      onEditingComplete: () {}, // _submit,
    );
  }

  _updateState() {
    setState(() {});
  }

//   Future<void> _submit() async {
//     final auth = Provider.of<Auth>(context, listen: false);
//     setState(() {
//       _submitted = true;
//       _isLoading = true;
//     });
//     try {
//       await auth.resetPassword(_email);
//       Navigator.pop(context);
//     } on PlatformException catch (e) {
//       PlatformExceptionALertDialog(
//         title: 'sending reset email failed',
//         exception: e,
//       ).show(context);
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }
}
