import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  @required
  final Widget child;
  final Color color;
  final double borderRadius;
  final double height;
  final VoidCallback onPressed;
  CustomRaisedButton({
    this.child,
    this.color,
    this.borderRadius: 5.0,
    this.height: 50.0,
    this.onPressed,
  }) : assert(child != null);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: RaisedButton(
        child: child,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
