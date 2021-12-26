import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/constants/controllers.dart';
import '/constants/style.dart';

import '../custom_text.dart';

class VerticalMenuItem extends StatelessWidget {
  final String itemName;
  final Function() onTap;
  const VerticalMenuItem({
    Key? key,
    required this.itemName,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onHover: (value) {
        value ? menuController.onHover(itemName) : menuController.onHover("not hovering");
      },
      child: Obx(
        () => Container(
          color: menuController.isHovering(itemName) ? lightGrey.withOpacity(.1) : Colors.transparent,
          child: Row(
            children: [
              Visibility(
                visible: menuController.isHovering(itemName) || menuController.isActive(itemName),
                child: Container(
                  width: 6,
                  height: 40,
                  color: dark,
                ),
                maintainSize: true,
                maintainState: true,
                maintainAnimation: true,
              ),
              Expanded(
                  child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: menuController.retrunIconFor(itemName),
                  ),
                  if (!menuController.isActive(itemName))
                    Flexible(
                      child: CustomText(
                        text: itemName,
                        color: menuController.isHovering(itemName) ? dark : lightGrey,
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
                    ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
