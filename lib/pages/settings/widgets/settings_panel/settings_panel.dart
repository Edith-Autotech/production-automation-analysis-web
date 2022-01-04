import 'package:flutter/material.dart';

import '/constants/style.dart';
import '/helper/settings_navigation.dart';

class SettingsPannel extends StatelessWidget {
  const SettingsPannel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return Container(
      height: _height * 0.8,
      padding: EdgeInsets.all(defaultPadding),
      child: settingsNavigator(),
    );
  }
}
