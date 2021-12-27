import 'package:flutter/material.dart';

Widget loadingSpinner(BuildContext context) {
  final ThemeData theme = Theme.of(context);
  return Center(
    child: CircularProgressIndicator(
      color: theme.colorScheme.secondary,
    ),
  );
}
