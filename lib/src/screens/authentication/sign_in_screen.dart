import 'package:flutter/material.dart';
import 'package:production_automation_web/src/widgets/app_bar/default_app_bar.dart';
import 'package:production_automation_web/src/widgets/box/sized_box.dart';
import 'package:production_automation_web/src/widgets/card/email_sign_in_card.dart';
import 'package:production_automation_web/src/widgets/label/label.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: defaultAppBar(context),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(100.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  label("Welcome!"),
                  sizedBox(h: 10),
                  label("Let's get you started..."),
                ],
              ),
            ),
            Expanded(child: Container()),
            SizedBox(
              width: 0.3 * size.width,
              height: 0.7 * size.height,
              child: const EmailSignInCard(),
            ),
            sizedBox(w: 30),
          ],
        ),
      ),
    );
  }
}
