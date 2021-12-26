import 'package:flutter/material.dart';
import 'package:production_automation_web/widgets/custom_text.dart';

import '/pages/base_page_layout.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BasePageLayout(
      children: [
        CustomText(text: "Overview page"),
      ],
    );
  }
}
