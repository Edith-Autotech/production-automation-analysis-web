import 'package:flutter/material.dart';

import '/widgets/custom_text.dart';

Widget rowElement(
  String label,
  Widget actionWidget,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: CustomText(
          label,
          size: 21,
          weight: FontWeight.normal,
        ),
      ),
      Expanded(child: Container()),
      Expanded(child: actionWidget),
    ],
  );
}
