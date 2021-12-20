// ignore_for_file: use_key_in_widget_constructors

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './platform_widget.dart';

class PlatformAlertDialog extends PlatformWidget {
  final String title;
  final String content;
  final String defaultActionText;
  final String? cancelActionText;
  final Function? actionHandler;
  const PlatformAlertDialog({
    Key? key,
    required this.title,
    required this.content,
    this.cancelActionText,
    required this.defaultActionText,
    this.actionHandler,
  });
  Future<bool?> show(BuildContext context) async {
    if (Platform.isIOS) {
      return await showCupertinoDialog<bool>(
        context: context,
        builder: (context) => this,
      );
    } else {
      return await showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (context) => this,
      );
    }
  }

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline6!.copyWith(
              color: Colors.black,
            ),
      ),
      content: Text(
        content,
        style: Theme.of(context).textTheme.headline6!.copyWith(
              color: Colors.black,
            ),
      ),
      actions: _buildActions(context),
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline6!.copyWith(
              color: Colors.black,
            ),
      ),
      content: Text(
        content,
        style: Theme.of(context).textTheme.headline6!.copyWith(
              color: Colors.black,
            ),
      ),
      actions: _buildActions(context),
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    final actions = <Widget>[];
    if (cancelActionText != null) {
      actions.add(
        PlatformAlertDialogAction(
          child: Text(cancelActionText!),
          onPressed: () => Navigator.of(context).pop(false),
        ),
      );
    }
    actions.add(
      PlatformAlertDialogAction(
        child: Text(defaultActionText),
        onPressed: actionHandler != null
            ? () => actionHandler
            : () => Navigator.of(context).pop(true),
      ),
    );
    return actions;
  }
}

class PlatformAlertDialogAction extends PlatformWidget {
  final Widget child;
  final VoidCallback onPressed;
  const PlatformAlertDialogAction({
    required this.child,
    required this.onPressed,
  });

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return CupertinoDialogAction(
      child: child,
      onPressed: onPressed,
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return TextButton(
      child: child,
      onPressed: onPressed,
    );
  }
}
