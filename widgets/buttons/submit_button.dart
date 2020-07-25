import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import './custom_raised_button.dart';


class SubmitButton extends CustomRaisedButton {
  SubmitButton({
    Color color,
    @required String text,
   VoidCallback onPressed,
  })  : assert(text != null,),
        super(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
          height: 44.0,
          color: color,
          borderRadius: 10.0,
          onPressed: onPressed,
        );
}
