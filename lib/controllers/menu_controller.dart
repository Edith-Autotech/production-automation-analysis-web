import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/constants/style.dart';
import '/routing/routes.dart';

class MenuController extends GetxController {
  static MenuController instance = Get.find();

  var activeItem = overViewPageDisplayName.obs;
  var hoverItem = "".obs;

  changeActiveItem(String itemName) {
    activeItem.value = itemName;
  }

  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  isActive(String itemName) => itemName == activeItem.value;

  isHovering(String itemName) => itemName == hoverItem.value;

  Widget retrunIconFor(String itemName) {
    switch (itemName) {
      case overViewPageDisplayName:
        return _customIcon(Icons.trending_up, itemName);
      case machinesPageDisplayName:
        return _customIcon(Icons.developer_board, itemName);
      case partsPageDisplayName:
        return _customIcon(Icons.pie_chart_sharp, itemName);
      case profilePageDisplayName:
        return _customIcon(Icons.people_alt_outlined, itemName);
      case settingsPageDisplayName:
        return _customIcon(Icons.settings_outlined, itemName);
      case authenticationPageDisplayName:
        return _customIcon(Icons.exit_to_app, itemName);
      default:
        return _customIcon(Icons.exit_to_app_outlined, itemName);
    }
  }

  Widget _customIcon(IconData iconData, String itemName) {
    if (isActive(itemName)) {
      return Icon(
        iconData,
        color: dark,
        size: 22,
      );
    }
    return Icon(
      iconData,
      color: isHovering(itemName) ? dark : light,
    );
  }
}
