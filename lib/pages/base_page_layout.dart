import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:production_automation_web/constants/controllers.dart';
import 'package:production_automation_web/helper/responsive.dart';
import 'package:production_automation_web/widgets/custom_text.dart';

class BasePageLayout extends StatelessWidget {
  final List<Widget>? children;
  const BasePageLayout({Key? key, this.children}) : super(key: key);

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
                    text: menuController.activeItem.value,
                    size: 24,
                    weight: FontWeight.bold,
                  ),
                )
              ],
            )),
        Expanded(
          child: ListView(
            children: children ?? [],
          ),
        )
      ],
    );
  }
}