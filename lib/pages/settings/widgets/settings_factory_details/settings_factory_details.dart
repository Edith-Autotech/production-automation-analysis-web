import 'package:flutter/material.dart';

import '/constants/controllers.dart';
import '/widgets/custom_text.dart';

class SettingsFactoryDetails extends StatelessWidget {
  const SettingsFactoryDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: settingsMenuController.activeItem.value,
          size: 22,
          weight: FontWeight.w600,
        )
      ],
    );
  }
}
