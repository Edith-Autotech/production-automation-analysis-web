import 'package:flutter/material.dart';

import '/pages/base_page_layout.dart';

import 'widgets/settings_menu/settings_menu.dart';
import 'widgets/settings_panel/settings_panel.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePageLayout(
      child: ListView(
        children: [
          Row(
            children: const [
              Expanded(flex: 2, child: SettingsMenu()),
              Expanded(flex: 5, child: SettingsPannel()),
            ],
          )
        ],
      ),
    );
  }
}
