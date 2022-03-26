import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/constants/style.dart';
import '/constants/controllers.dart';

import '/widgets/custom_text.dart';
import '/widgets/loading_spinner.dart';

import 'widgets/selected_part/selected_part.dart';
import 'widgets/part_list/parts_list.dart';
import 'widgets/header/header.dart';

import '../base_page_layout.dart';

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
          return loadingSpinner();
        } else if (partController.partsList.isEmpty) {
          return const Center(child: CustomText(text: "No Data"));
        } else {
          return ListView(
            children: [
              const Header(),
              SizedBox(height: defaultPadding),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Expanded(
                    flex: 2,
                    child: PartsList(),
                  ),
                  Expanded(
                    flex: 5,
                    child: SelectedPartSection(),
                  ),
                ],
              ),
            ],
          );
        }
      }),
    );
  }
}
