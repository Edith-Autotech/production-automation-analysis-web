import 'package:flutter/material.dart';

Widget label(
  String text, {
  double? fontSize,
  FontWeight? weight,
  Color? textColor,
}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: fontSize ?? 16,
      fontWeight: weight ?? FontWeight.w400,
      color: textColor ?? Colors.black,
    ),
  );
}
