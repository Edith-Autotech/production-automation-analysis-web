import 'package:flutter/material.dart';

Widget gradientBoxWithBorder(Widget child) {
  return Container(
    constraints: const BoxConstraints(
      maxHeight: 90,
      maxWidth: 90,
    ),
    margin: const EdgeInsets.all(5),
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        colors: [
          Colors.amber,
          Colors.lightGreenAccent,
        ],
      ),
      borderRadius: BorderRadius.circular(20),
    ),

    padding: const EdgeInsets.all(3),
    child: DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: child,
      ),
    ),
    // ),
  );
}
