import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/constants/controllers.dart';
import '/constants/style.dart';
import '/widgets/custom_text_field.dart';
import '/widgets/loading_spinner.dart';
import '../../widgets/row_element.dart';
import '../../widgets/submit_button.dart';
import '../base_settings_page_layout.dart';

class SettingsFactoryDetails extends StatefulWidget {
  const SettingsFactoryDetails({Key? key}) : super(key: key);

  @override
  State<SettingsFactoryDetails> createState() => _SettingsFactoryDetailsState();
}

class _SettingsFactoryDetailsState extends State<SettingsFactoryDetails> {
  final TextEditingController _factoryNameController = TextEditingController();

  final FocusNode _factoryNameFocusNode = FocusNode();

  String get _factoryName => _factoryNameController.text;

  bool get showSubmitBtn => _factoryName.isNotEmpty;

  @override
  void initState() {
    super.initState();
    factoryController.getFactory();
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return BaseSettingsPageLayout(
      child: Container(
        margin: const EdgeInsets.all(defaultPadding),
        padding: const EdgeInsets.all(defaultPadding),
        height: _height * 0.8,
        child: Obx(
          () {
            if (factoryController.isLoading.value) {
              return const LoadingSpinner();
            } else {
              return Column(
                children: [
                  rowElement(
                    "Factory Name",
                    CustomTextField(
                      controller: _factoryNameController,
                      focusNode: _factoryNameFocusNode,
                      onChanged: (value) => setState(() {}),
                      hintText: factoryController.activeFactory.value.factoryName,
                      onEditingComplete: () {},
                    ),
                  ),
                  const SizedBox(height: defaultPadding),
                  if (showSubmitBtn) SubmitButton(onPressed: () {})
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
