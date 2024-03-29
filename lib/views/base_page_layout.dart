import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/constants/controllers.dart';
import '/helper/responsive.dart';
import '/widgets/custom_text.dart';

class BasePageLayout extends StatelessWidget {
  final Widget child;
  const BasePageLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() => Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6,
                  ),
                  child: CustomText(
                    menuController.activeItem.value,
                    size: 24,
                    weight: FontWeight.bold,
                  ),
                )
              ],
            )),
        Expanded(child: child)
      ],
    );
  }
}
