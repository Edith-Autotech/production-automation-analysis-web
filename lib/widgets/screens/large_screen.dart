import 'package:flutter/material.dart';
import 'package:production_automation_web/helper/local_navigation.dart';
import 'package:production_automation_web/widgets/side_menu/side_menu.dart';

class LargeScreen extends StatelessWidget {
  const LargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(flex: 1, child: SideMenu()),
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: localNavigator(),
          ),
        )
      ],
    );
  }
}
