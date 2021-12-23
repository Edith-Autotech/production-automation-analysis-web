import 'package:flutter/material.dart';

Widget defaultBackground(BuildContext context, Widget child) {
  final Size size = MediaQuery.of(context).size;
  final ThemeData theme = Theme.of(context);
  return Container(
    constraints: BoxConstraints(
      minHeight: size.height,
      maxHeight: size.height,
      minWidth: size.width,
      maxWidth: size.width,
    ),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: FractionalOffset.topCenter,
        end: FractionalOffset.center,
        colors: [
          theme.colorScheme.secondary,
          Colors.transparent,
        ],
      ),
    ),
    child: Stack(
      children: [
        Positioned(
          top: 115,
          child: Container(
            constraints: BoxConstraints(
              maxHeight: size.height,
              maxWidth: size.width,
            ),
            height: 0.90 * size.height,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: child,
          ),
        ),
      ],
    ),
  );
}
