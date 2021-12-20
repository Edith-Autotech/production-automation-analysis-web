import 'package:flutter/material.dart';

import './custom_raised_button.dart';

class SignInButton extends CustomRaisedButton {
  SignInButton({
    Key? key,
    required String? text,
    required Color color,
    Color? textColor,
    VoidCallback? onPressed,
  })  : assert(text != null),
        super(
          key: key,
          child: Text(
            text!,
            style: TextStyle(
              color: textColor,
              letterSpacing: 1.5,
              fontSize: 19.0,
            ),
          ),
          color: color,
          width: 22,
          onPressed: onPressed!,
          borderRadius: 10,
          height: 50,
        );
}
