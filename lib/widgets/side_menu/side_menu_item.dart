import 'package:flutter/material.dart';
import '/helper/responsive.dart';

import '/widgets/side_menu/horizontal_menu_item.dart';
import '/widgets/side_menu/vertical_menu_item.dart';

class SideMenuItem extends StatelessWidget {
  final String itemName;
  final Function() onTap;
  const SideMenuItem({
    Key? key,
    required this.itemName,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (ResponsiveWidget.isCustomSize(context)) {
      return VerticalMenuItem(
        itemName: itemName,
        onTap: onTap,
      );
    }
    return HorizontalMenuItem(
      itemName: itemName,
      onTap: onTap,
    );
  }
}
