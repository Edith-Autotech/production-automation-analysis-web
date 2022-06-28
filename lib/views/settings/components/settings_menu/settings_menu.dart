import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/constants/controllers.dart';
import '/constants/style.dart';
import '/helper/responsive.dart';
import '/routes/settings_routes.dart';
import 'widgets/settings_side_menu_item.dart';

class SettingsMenu extends StatelessWidget {
  const SettingsMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      height: _height * 0.8,
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(
            color: lightGrey,
            width: 1.15,
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: settingsMenuItems
            .map(
              (settingsMenuItem) => SettingsSideMenuItem(
                itemName: settingsMenuItem.name,
                onTap: () {
                  if (!settingsMenuController.isActive(settingsMenuItem.name)) {
                    settingsMenuController.changeActiveItem(settingsMenuItem.name);
                    if (ResponsiveWidget.isSmallScreen(context)) {
                      Get.back();
                    }
                    settingsNavigationController.navigateTo(
                      settingsMenuItem.name,
                    );
                  }
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
