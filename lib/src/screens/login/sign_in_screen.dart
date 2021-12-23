import 'package:flutter/material.dart';
import 'components/email_sign_in_card.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 0.3 * size.width,
          height: 0.7 * size.height,
          child: const EmailSignInCard(),
        ),
      ),
    );
  }
}
