import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/widgets/loading_spinner.dart';

import '/constants/controllers.dart';

import '../base_settings_page_layout.dart';
import 'widgets/reason_list_tile.dart';

class SettingsReasons extends StatefulWidget {
  const SettingsReasons({Key? key}) : super(key: key);

  @override
  State<SettingsReasons> createState() => _SettingsReasonsState();
}

class _SettingsReasonsState extends State<SettingsReasons> {
  @override
  void initState() {
    super.initState();
    reasonController.getReasons();
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return BaseSettingsPageLayout(
      child: SizedBox(
        height: _height * 0.8,
        child: Obx(() {
          if (reasonController.isLoading.value) {
            return loadingSpinner();
          }
          return ListView(
            children: reasonController.reasonList
                .map(
                  (element) => ReasonListTile(
                    reason: element,
                  ),
                )
                .toList(),
          );
        }),
      ),
    );
  }
}
