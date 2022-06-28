import 'package:flutter/material.dart';
import 'package:production_automation_web/constants/style.dart';

import '/helper/local_navigation.dart';
import '/widgets/side_menu/side_menu.dart';

class LargeScreen extends StatelessWidget {
  const LargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(flex: 1, child: SideMenu()),
        Expanded(
          flex: 5,
          child: Container(
            color: canvasColor,
            padding: const EdgeInsets.all(defaultPadding),
            child: localNavigator(),
          ),
        )
      ],
    );
  }
}
