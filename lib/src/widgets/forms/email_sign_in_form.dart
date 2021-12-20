import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:production_automation_web/config/grapqhql_database.dart';
import 'package:production_automation_web/src/screens/landing_screens/landing_screen_auth.dart';
import 'package:production_automation_web/src/widgets/Validators/validators.dart';
import 'package:production_automation_web/src/widgets/box/sized_box.dart';
import 'package:production_automation_web/src/widgets/buttons%20copy/submit_button.dart';
import 'package:production_automation_web/src/widgets/loading_spinner/loading_spinner.dart';
import 'package:production_automation_web/src/widgets/text_field/custom_text_field.dart';
import 'package:provider/provider.dart';

class EmailSignInForm extends StatefulWidget with Validators {
  EmailSignInForm({Key? key}) : super(key: key);

  @override
  _EmailSignInFormState createState() => _EmailSignInFormState();
}

class _EmailSignInFormState extends State<EmailSignInForm> {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  String get _email => _emailController.text;
  String get _password => _passwordController.text;
  bool _submitted = false;
  bool _isLoading = false;
  bool _obscureText = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _submit() async {
    setState(() {
      _submitted = true;
      _isLoading = true;
    });
    final ApiDatabase auth = Provider.of<ApiDatabase>(context, listen: false);
    await auth.login(_email, _password).catchError((error) {
      // print("Error Occured");
      // print(error);
      Fluttertoast.showToast(msg: error);
      _submitted = false;
      _isLoading = false;
      setState(() {});
    }).then((value) async {
      await _storage.write(key: "jwt", value: value);
      _submitted = false;
      _isLoading = false;
      setState(() {});
      Navigator.pushReplacementNamed(context, LandingScreen.routeName);
    });
  }

  void _emailEditingComplete() {
    final newFocus = widget.emailValidator.isValid(_email) ? _passwordFocusNode : _emailFocusNode;
    FocusScope.of(context).requestFocus(newFocus);
  }

  Widget _buildHeader() {
    if (_isLoading) {
      return loadingSpinner(context);
    }
    return Text(
      'Sign in',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline3,
    );
  }

  List<Widget> _buildChildren() {
    final Size size = MediaQuery.of(context).size;
    final ThemeData theme = Theme.of(context);
    const primaryText = 'Sign in';

    bool submitEnabled =
        widget.emailValidator.isValid(_email) && widget.passwordVaidator.isValid(_password) && !_isLoading;

    return [
      _buildHeader(),
      sizedBox(h: 0.1 * size.height),
      _buildEmailTextField(),
      sizedBox(h: 0.05 * size.height),
      _buildPasswordTextField(),
      sizedBox(h: 0.05 * size.height),
      SubmitButton(
        text: primaryText,
        onPressed: submitEnabled ? _submit : () {},
        color: theme.colorScheme.secondary,
      ),
      // TextButton(
      //   child: Text("Forgot password", style: theme.textTheme.button),
      //   onPressed: !_isLoading
      //       ? () => Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //               builder: (_) => const ForgotPasswordForm(),
      //             ),
      //           )
      //       : null,
      // ),
    ];
  }

  CustomTextField _buildPasswordTextField() {
    bool showErrorText = _submitted && !widget.passwordVaidator.isValid(_password);
    return CustomTextField(
      controller: _passwordController,
      focusNode: _passwordFocusNode,
      labelText: 'Password',
      errorText: showErrorText ? widget.invalidPasswordError : null,
      enabled: _isLoading == false,
      obscureText: _obscureText,
      sufixIcon: IconButton(
        icon: Icon(
          Icons.remove_red_eye,
          color: !_obscureText ? Colors.blue : Colors.grey,
        ),
        onPressed: () => setState(() => _obscureText = !_obscureText),
      ),
      inputAction: TextInputAction.done,
      onChanged: (password) => _updateState(),
      onEditingComplete: _submit,
    );
  }

  CustomTextField _buildEmailTextField() {
    bool showErrorText = _submitted && !widget.emailValidator.isValid(_email);
    return CustomTextField(
      controller: _emailController,
      focusNode: _emailFocusNode,
      labelText: 'Email',
      hintText: 'john@edithautotech.com',
      errorText: showErrorText ? widget.invalidEmailError : null,
      enabled: _isLoading == false,
      inputType: TextInputType.emailAddress,
      inputAction: TextInputAction.next,
      onChanged: (email) => _updateState(),
      onEditingComplete: _emailEditingComplete,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: _buildChildren(),
      ),
    );
  }

  void _updateState() => setState(() {});
}
