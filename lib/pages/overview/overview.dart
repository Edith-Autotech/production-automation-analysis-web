import 'package:flutter/material.dart';
import '/widgets/custom_text.dart';

import '/pages/base_page_layout.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BasePageLayout(
      child: ListView(
        children: const [CustomText(text: "Overview page")],
      ),
    );
  }
}
