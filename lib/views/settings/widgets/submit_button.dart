import 'package:flutter/material.dart';

import '/constants/style.dart';
import '/widgets/custom_text.dart';

class SubmitButton extends StatelessWidget {
  final void Function()? onPressed;
  const SubmitButton({
    Key? key,
    this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Container(
        margin: const EdgeInsets.all(10),
        child: const CustomText(
          "Submit",
          size: 19,
          weight: FontWeight.w600,
          color: light,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: active,
      ),
      onPressed: onPressed,
    );
  }
}
