import 'package:flutter/material.dart';

Widget boxWithBorder(Widget child, {bool showBorder = true}) {
  return
      // Expanded(
      //   child:
      Container(
    margin: const EdgeInsets.all(2),
    decoration: BoxDecoration(
      border: showBorder
          ? Border.all(
              width: 2,
              color: Colors.grey[400]!,
            )
          : null,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
    ),
    padding: const EdgeInsets.all(10),
    child: Center(
      child: child,
    ),
    // ),
  );
}
