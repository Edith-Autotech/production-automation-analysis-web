import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:production_automation_web/constants/controllers.dart';
import 'package:production_automation_web/constants/style.dart';
import 'package:production_automation_web/views/base_page_layout.dart';
import 'package:production_automation_web/views/parts/widgets/header/header.dart';
import 'package:production_automation_web/views/parts/widgets/selected_part/selected_part.dart';
import 'package:production_automation_web/widgets/custom_text.dart';
import 'package:production_automation_web/widgets/loading_spinner.dart';

class SelectedPartPage extends StatelessWidget {
  const SelectedPartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePageLayout(
      child: Obx(
        () {
          if (partController.isLoading.value) {
            return const LoadingSpinner();
          } else if (partController.selectedPart.value == null) {
            return const Center(child: CustomText("No Data"));
          } else {
            return ListView(
              children: [
                const PartsHeader(),
                const SizedBox(height: defaultPadding),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Expanded(
                      flex: 5,
                      child: SelectedPartSection(),
                    ),
                    SizedBox(width: defaultPadding),
                  ],
                )
              ],
            );
          }
        },
      ),
    );
  }
}
