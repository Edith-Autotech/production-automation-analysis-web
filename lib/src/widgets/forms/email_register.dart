// // import 'package:adminapp/provider/auth.dart';
// import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// import 'package:flutter/services.dart';

// import '../Validators/validators.dart';
// import '../buttons/submit_button.dart';
// // import '../dialog_box/platform_exception_alert_dialog.dart';
// import '../text_fields/custom_text_field.dart';

// class RegisterEmailForm extends StatefulWidget with Validators {
//   @override
//   _RegisterEmailFormState createState() => _RegisterEmailFormState();
// }

// class _RegisterEmailFormState extends State<RegisterEmailForm> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final FocusNode _emailFocusNode = FocusNode();
//   final FocusNode _passwordFocusNode = FocusNode();

//   String get _email => _emailController.text;
//   String get _password => _passwordController.text;
//   // bool _submitted = false;
//   bool _isLoading = false;
//   bool _obscureText = true;

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     _emailFocusNode.dispose();
//     _passwordFocusNode.dispose();
//     super.dispose();
//   }

//   // void _submit() async {
//   //   setState(() {
//   //     _submitted = true;
//   //     _isLoading = true;
//   //   });
//   //   try {
//   //     final auth = Provider.of<Auth>(context);
//   //     await auth.createUserWithEmailAndPassword(_email, _password);
//   //     Navigator.pop(context);
//   //   } on PlatformException catch (e) {
//   //     PlatformExceptionALertDialog(
//   //       title: 'Sign in failed',
//   //       exception: e,
//   //     ).show(context);
//   //   } finally {
//   //     setState(() {
//   //       _isLoading = false;
//   //     });
//   //   }
//   // }

//   void _emailEditingComplete() {
//     final newFocus = widget.emailValidator.isValid(_email) ? _passwordFocusNode : _emailFocusNode;
//     FocusScope.of(context).requestFocus(newFocus);
//   }

//   List<Widget> _buildChildren() {
//     final mediaQuery = MediaQuery.of(context).size;
//     final primaryText = 'Create an account';

//     bool submitEnabled =
//         widget.emailValidator.isValid(_email) && widget.passwordVaidator.isValid(_password) && !_isLoading;

//     return [
//       SizedBox(height: 0.05 * mediaQuery.height),
//       Text(
//         "Welcome to Smart Display!!",
//         style: Theme.of(context).textTheme.headline2,
//       ),
//       SizedBox(height: 0.05 * mediaQuery.height),
//       Text(
//         "Let's get you started!",
//         style: Theme.of(context).textTheme.headline2,
//       ),
//       SizedBox(height: 0.05 * mediaQuery.height),
//       _buildEmailTextField(),
//       SizedBox(height: 0.03 * mediaQuery.height),
//       _buildPasswordTextField(),
//       SizedBox(height: 0.1 * mediaQuery.height),
//       SubmitButton(
//         text: primaryText,
//         color: Theme.of(context).accentColor,
//         onPressed: submitEnabled ? () {} : null,
//       ),
//     ];
//   }

//   CustomTextField _buildPasswordTextField() {
//     // bool showErrorText = _submitted && !widget.passwordVaidator.isValid(_password);
//     return CustomTextField(
//       controller: _passwordController,
//       focusNode: _passwordFocusNode,
//       labelText: 'Password',
//       errorText: "showErrorText", //? widget.invalidPasswordError : null,
//       enabled: _isLoading == false,
//       obscureText: _obscureText,
//       sufixIcon: IconButton(
//         icon: Icon(
//           Icons.remove_red_eye,
//           color: !_obscureText ? Colors.blue : Colors.grey,
//         ),
//         onPressed: () => setState(() => _obscureText = !_obscureText),
//       ),
//       inputAction: TextInputAction.done,
//       onChanged: (password) => _updateState(),
//       onEditingComplete: () {},
//     );
//   }

//   CustomTextField _buildEmailTextField() {
//     // bool showErrorText = _submitted && !widget.emailValidator.isValid(_email);
//     return CustomTextField(
//       controller: _emailController,
//       focusNode: _emailFocusNode,
//       labelText: 'Email',
//       hintText: 'test@test.com',
//       errorText: "showErrorText", // ? widget.invalidEmailError : null,
//       enabled: _isLoading == false,
//       inputType: TextInputType.emailAddress,
//       inputAction: TextInputAction.next,
//       onChanged: (email) => _updateState(),
//       onEditingComplete: _emailEditingComplete,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         mainAxisSize: MainAxisSize.min,
//         children: _buildChildren(),
//       ),
//     );
//   }

//   void _updateState() {
//     setState(() {});
//   }
// }
