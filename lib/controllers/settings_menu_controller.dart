import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/routing/settings_routes.dart';

import '/constants/style.dart';

class SettingsMenuController extends GetxController {
  static SettingsMenuController instance = Get.find();

  var activeItem = settingsUsersDisplayName.obs;
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
      case settingsUsersDisplayName:
        return _customIcon(Icons.people, itemName);
      case settingsAddNewUserDisplayName:
        return _customIcon(Icons.person_add, itemName);
      case settingsFactoryDetailsDisplayName:
        return _customIcon(Icons.villa, itemName);
      case settingsReasonsListDisplayName:
        return _customIcon(Icons.workspaces_outlined, itemName);
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
