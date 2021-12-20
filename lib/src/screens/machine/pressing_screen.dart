import 'package:flutter/material.dart';
import 'package:production_automation_web/src/widgets/label/label.dart';

class PressingScreen extends StatelessWidget {
  const PressingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: label("Pressing screen"),
    );
  }
}
