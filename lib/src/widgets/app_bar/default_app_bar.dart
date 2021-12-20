import 'package:flutter/material.dart';
import 'package:production_automation_web/src/widgets/label/label.dart';

AppBar defaultAppBar(
  BuildContext context, {
  String? text,
  List<Widget>? actions,
  bool showBackButton = false,
}) {
  final AppBarTheme theme = Theme.of(context).appBarTheme;
  return AppBar(
    elevation: theme.elevation,
    backgroundColor: theme.backgroundColor,
    leading: showBackButton
        ? TextButton(
            child: Image.asset(
              "assets/Form/drawable-hdpi/Path28.png",
            ),
            onPressed: () => Navigator.pop(context),
          )
        : null,
    title: label(
      text ?? "Production automation",
      fontSize: 22,
      weight: FontWeight.bold,
    ),
    actions: actions,
  );
}
