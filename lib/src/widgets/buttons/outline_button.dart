import 'package:flutter/material.dart';

OutlinedButton otButton({required Widget child, required VoidCallback onPressed}) {
  return OutlinedButton(
    style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
    onPressed: onPressed,
    child: child,
  );
}
