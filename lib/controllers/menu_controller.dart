import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/constants/style.dart';
import '/routes/routes.dart';

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
        return _customIcon(Icons.pages, itemName);
      case machinesPageDisplayName:
        return _customIcon(Icons.hub_outlined, itemName);
      case partsPageDisplayName:
        return _customIcon(Icons.description, itemName);
      case profilePageDisplayName:
        return _customIcon(Icons.person, itemName);
      case settingsPageDisplayName:
        return _customIcon(Icons.settings_outlined, itemName);
      case authenticationPageDisplayName:
        return _customIcon(Icons.exit_to_app_outlined, itemName);
      default:
        return _customIcon(Icons.exit_to_app_outlined, itemName);
    }
  }

  Widget _customIcon(IconData iconData, String itemName) {
    if (isActive(itemName)) {
      return Icon(
        iconData,
        color: active,
        size: 25,
      );
    }
    return Icon(
      iconData,
      color: isHovering(itemName) ? active : light,
    );
  }

}
