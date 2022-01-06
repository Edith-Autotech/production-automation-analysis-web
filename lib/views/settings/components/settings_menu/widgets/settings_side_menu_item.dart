import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/constants/controllers.dart';
import '/constants/style.dart';
import '/widgets/custom_text.dart';

class SettingsSideMenuItem extends StatelessWidget {
  final String itemName;
  final Function() onTap;
  const SettingsSideMenuItem({
    Key? key,
    required this.itemName,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      onHover: (value) {
        value ? settingsMenuController.onHover(itemName) : settingsMenuController.onHover("not hovering");
      },
      child: Obx(
        () => Container(
          color: settingsMenuController.isHovering(itemName) ? lightGrey.withOpacity(.1) : Colors.transparent,
          child: Row(
            children: [
              Visibility(
                visible: settingsMenuController.isHovering(itemName) || settingsMenuController.isActive(itemName),
                child: Container(
                  width: 6,
                  height: 40,
                  color: dark,
                ),
                maintainSize: true,
                maintainState: true,
                maintainAnimation: true,
              ),
              SizedBox(width: _width / 80),
              Padding(
                padding: const EdgeInsets.all(16),
                child: settingsMenuController.retrunIconFor(itemName),
              ),
              if (!settingsMenuController.isActive(itemName))
                Flexible(
                  child: CustomText(
                    text: itemName,
                    color: settingsMenuController.isHovering(itemName) ? dark : lightGrey,
                  ),
                )
              else
                Flexible(
                  child: CustomText(
                    text: itemName,
                    size: 18,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
