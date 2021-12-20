import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  @required
  final Widget? child;
  final Color color;
  final double borderRadius;
  final double width;
  final double height;
  final VoidCallback onPressed;
  const CustomRaisedButton({
    Key? key,
    this.child,
    required this.color,
    required this.borderRadius,
    required this.width,
    required this.onPressed,
    required this.height,
  })  : assert(child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        child: child,
        style: ElevatedButton.styleFrom(
          primary: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
