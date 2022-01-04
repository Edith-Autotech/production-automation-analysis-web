import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/constants/controllers.dart';
import '/constants/style.dart';
import '/helper/responsive.dart';
import '/routing/routes.dart';
import '/widgets/custom_text.dart';
import '/widgets/side_menu/side_menu_item.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Container(
      color: light,
      child: ListView(
        children: [
          if (ResponsiveWidget.isSmallScreen(context))
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 40),
                Row(
                  children: [
                    SizedBox(width: _width / 48),
                    const Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: Icon(Icons.ac_unit),
                    ),
                    Flexible(
                      child: CustomText(
                        text: "PAA",
                        size: 20,
                        weight: FontWeight.bold,
                        color: active,
                      ),
                    )
                  ],
                )
              ],
            ),
          Divider(color: lightGrey.withOpacity(.1)),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: menuItems
                .map(
                  (menuItem) => SideMenuItem(
                    itemName: menuItem.name,
                    onTap: () {
                      if (menuItem.route == authenticationPageRouteName) {
                        // print("logout called");
                        userController.logout();
                      }
                      if (!menuController.isActive(menuItem.name)) {
                        menuController.changeActiveItem(menuItem.name);
                        if (ResponsiveWidget.isSmallScreen(context)) {
                          Get.back();
                        }
                        navigationController.navigateTo(menuItem.name);
                      }
                    },
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
