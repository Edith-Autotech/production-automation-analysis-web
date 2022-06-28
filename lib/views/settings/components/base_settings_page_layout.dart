import 'package:flutter/material.dart';

import '/constants/controllers.dart';
import '/widgets/custom_text.dart';

class BaseSettingsPageLayout extends StatelessWidget {
  final Widget child;
  const BaseSettingsPageLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          settingsMenuController.activeItem.value,
          size: 22,
          weight: FontWeight.w600,
        ),
        Expanded(child: child),
      ],
    );
  }
}
