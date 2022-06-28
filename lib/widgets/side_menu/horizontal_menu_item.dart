import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/constants/controllers.dart';
import '/constants/style.dart';

import '../custom_text.dart';

class HorizontalMenuItem extends StatelessWidget {
  final String itemName;
  final Function() onTap;
  const HorizontalMenuItem({
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
                  color: active,
                ),
                maintainSize: true,
                maintainState: true,
                maintainAnimation: true,
              ),
              SizedBox(width: _width / 80),
              Padding(
                padding: const EdgeInsets.all(16),
                child: menuController.retrunIconFor(itemName),
              ),
              if (!menuController.isActive(itemName))
                Flexible(
                  child: CustomText(
                    itemName,
                    color: menuController.isHovering(itemName) ? active : lightGrey,
                  ),
                )
              else
                Flexible(
                  child: CustomText(
                    itemName,
                    size: 18,
                    color: active,
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
