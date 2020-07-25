import 'package:flutter/material.dart';

import './custom_raised_button.dart';

class SocialSignInButton extends CustomRaisedButton {
  SocialSignInButton({
    String assetName,
    String text,
    Color color,
    Color textColor,
    VoidCallback onPressed,
  })  : assert(text != null),
        assert(assetName != null),
        super(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.asset(assetName, height: 30, width: 30,),
              Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  // letterSpacing: 1.5,
                ),
              ),
              Opacity(
                child: Image.asset(assetName, height: 30, width: 30,),
                opacity: 0.0,
              )
            ],
          ),
          color: color,
          onPressed: onPressed,
        );
}
