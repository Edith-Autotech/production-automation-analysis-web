import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/constants/controllers.dart';

import '/widgets/custom_text.dart';

import 'widgets/accordion.dart';

import '../base_settings_page_layout.dart';

class SettingsUser extends StatefulWidget {
  const SettingsUser({Key? key}) : super(key: key);

  @override
  State<SettingsUser> createState() => _SettingsUserState();
}

class _SettingsUserState extends State<SettingsUser> {
  @override
  void initState() {
    super.initState();
    userController.getAllFactoryUsers();
  }

  @override
  Widget build(BuildContext context) {
    return BaseSettingsPageLayout(
      child: Obx(
        () {
          if (userController.allFactoryUsers.isEmpty) {
            return const Center(child: CustomText(text: "Loading..."));
          }
          return ListView(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            children: userController.allFactoryUsers
                .map(
                  (element) => Accordion(user: element),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
