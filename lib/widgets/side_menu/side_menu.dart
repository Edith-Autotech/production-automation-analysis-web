import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '/constants/controllers.dart';
import '/constants/style.dart';
import '/helper/responsive.dart';
import '/routes/routes.dart';
import '/widgets/side_menu/side_menu_item.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  // List<Widget> _buildChildren(BuildContext context) {
  //   List<Widget> children = [];

  //   for (var i = 0; i <= menuItems.length; i++) {
  //     if (i == (menuItems.length - 1)) {
  //       children.add(const Spacer());
  //     }
  //     var menuItem = menuItems[i];
  //     children.add(SideMenuItem(
  //       itemName: menuItem.name,
  //       onTap: () {
  //         if (menuItem.route == authenticationPageRouteName) {
  //           // print("logout called");
  //           userController.logout();
  //         }
  //         if (!menuController.isActive(menuItem.name)) {
  //           menuController.changeActiveItem(menuItem.name);
  //           if (ResponsiveWidget.isSmallScreen(context)) {
  //             navigationController.goBack();
  //           }
  //           navigationController.navigateTo(menuItem.name);
  //         }
  //       },
  //     ));
  //   }

  //   return children;
  // }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
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
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: SvgPicture.asset(
                        "assets/icons/logo.svg",
                        fit: BoxFit.contain,
                      ),
                    ),
                    // Flexible(
                    //   child: CustomText(
                    //     "PAA",
                    //     size: 20,
                    //     weight: FontWeight.bold,
                    //     color: active,
                    //   ),
                    // )
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
                          navigationController.goBack();
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
