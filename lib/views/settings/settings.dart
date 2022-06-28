import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/constants/controllers.dart';
import '/constants/style.dart';
import '/helper/settings_navigation.dart';
import '/widgets/loading_spinner.dart';
import '../base_page_layout.dart';
import 'components/settings_menu/settings_menu.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return BasePageLayout(
      child: ListView(
        children: [
          Row(
            children: [
              const Expanded(flex: 2, child: SettingsMenu()),
              Expanded(
                flex: 5,
                child: Obx(() {
                  if (userController.isLoading.value) {
                    return const LoadingSpinner();
                  } else {
                    return Container(
                      height: _height * 0.8,
                      padding: const EdgeInsets.all(defaultPadding),
                      child: settingsNavigator(),
                    );
                  }
                }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
