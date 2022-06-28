import 'package:flutter/material.dart';
import '/widgets/custom_text.dart';

import '../base_page_layout.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BasePageLayout(
      child: ListView(
        children: const [CustomText("Overview page")],
      ),
    );
  }
}
