import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:production_automation_web/widgets/loading_spinner.dart';

import '/constants/controllers.dart';
import '/constants/style.dart';
import '/widgets/custom_text.dart';
import '../base_page_layout.dart';
import 'widgets/header/header.dart';
import 'widgets/part_list/parts_list.dart';

class PartsPage extends StatefulWidget {
  const PartsPage({Key? key}) : super(key: key);

  @override
  State<PartsPage> createState() => _PartsPageState();
}

class _PartsPageState extends State<PartsPage> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    // await factoryController.getFactory();
    await partController.fetchParts();
  }

  @override
  Widget build(BuildContext context) {
    return BasePageLayout(
      child: Obx(() {
        if (partController.isLoading.value || factoryController.isLoading.value) {
          return const LoadingSpinner();
        } else if (partController.partsList.isEmpty) {
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
                    flex: 2,
                    child: PartsList(),
                  ),
                  SizedBox(width: defaultPadding),
                ],
              ),
            ],
          );
        }
      }),
    );
  }
}
