import 'package:flutter/material.dart';

Widget floatinActionButton(BuildContext context,
    {required Function onPressed}) {
  return FloatingActionButton(
    onPressed: () => onPressed(),
    child: const Icon(Icons.add, color: Colors.black),
    backgroundColor: Colors.greenAccent,
  );
}
