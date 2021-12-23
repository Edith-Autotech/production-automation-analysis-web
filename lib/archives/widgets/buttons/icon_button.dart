import 'package:flutter/material.dart';

IconButton customIconButton(VoidCallback onPressed, IconData iconData) {
  return IconButton(
    icon: Icon(iconData, size: 25),
    onPressed: onPressed,
  );
}
