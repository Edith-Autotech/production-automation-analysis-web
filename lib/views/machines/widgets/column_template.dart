import 'package:flutter/material.dart';

import '/constants/style.dart';

import '/widgets/custom_text.dart';

class ColumnTemplate extends StatelessWidget {
  final String titleText;
  final String subTitleText;
  final bool blackColorOverride;

  const ColumnTemplate({
    Key? key,
    required this.titleText,
    required this.subTitleText,
    this.blackColorOverride = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          titleText,
          color: blackColorOverride ? light : dark,
          size: 12,
          weight: FontWeight.w500,
        ),
        const SizedBox(height: 5),
        CustomText(
          subTitleText,
          color: blackColorOverride ? light : dark,
          size: 10,
          weight: FontWeight.w500,
        ),
      ],
    );
  }
}
