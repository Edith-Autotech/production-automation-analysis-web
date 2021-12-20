import 'package:flutter/material.dart';

import './custom_raised_button.dart';

class SocialSignInButton extends CustomRaisedButton {
  SocialSignInButton({
    Key? key,
    String? assetName,
    String? text,
    Color? color,
    Color? textColor,
    VoidCallback? onPressed,
  })  : assert(text != null),
        assert(assetName != null),
        super(
          key: key,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.asset(assetName!),
              Text(
                text!,
                style: TextStyle(
                  color: textColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                ),
              ),
              Opacity(
                child: Image.asset(assetName),
                opacity: 0.0,
              )
            ],
          ),
          color: color!,
          onPressed: onPressed!,
          width: 22,
          borderRadius: 10,
          height: 50,
        );
}
