import 'package:flutter/material.dart';

Widget rowItem({required List<Widget> children}) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: children,
      ),
    );
