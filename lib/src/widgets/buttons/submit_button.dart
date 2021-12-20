import 'package:flutter/material.dart';
import 'package:production_automation_web/src/widgets/label/label.dart';

import './custom_raised_button.dart';

class SubmitButton extends CustomRaisedButton {
  SubmitButton({
    Key? key,
    required Color color,
    required String text,
    required VoidCallback onPressed,
  }) : super(
          key: key,
          child: label(
            text,
            fontSize: 20,
            textColor: Colors.white,
          ),
          height: 44.0,
          color: color,
          borderRadius: 10.0,
          onPressed: onPressed,
        );
}
