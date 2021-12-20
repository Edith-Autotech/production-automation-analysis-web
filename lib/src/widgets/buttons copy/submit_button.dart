import 'package:flutter/material.dart';

import './custom_raised_button.dart';

class SubmitButton extends CustomRaisedButton {
  SubmitButton({
    Key? key,
    String? text,
    Color? color,
    VoidCallback? onPressed,
  })  : assert(
          text != null,
        ),
        super(
          key: key,
          child: Text(
            text!,
            style: TextStyle(
              color: onPressed == null ? Colors.white : Colors.black,
              fontSize: 20.0,
            ),
          ),
          height: 50.0,
          width: double.infinity,
          color: color!,
          borderRadius: 10.0,
          onPressed: onPressed!,
        );
}
