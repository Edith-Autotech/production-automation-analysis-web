import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:production_automation_web/widgets/custom_text.dart';
import 'package:production_automation_web/widgets/loading_spinner.dart';

import '/constants/controllers.dart';
import '/widgets/grid_view.dart';

import 'machine_grid_tile.dart';

class MachinesLargeScreen extends StatelessWidget {
  const MachinesLargeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Obx(() {
      if (machineController.isLoading.value) {
        return loadingSpinner(context);
      } else if (machineController.machineList.isEmpty) {
        return const Center(child: CustomText(text: "No data"));
      } else {
        return CustomGridView(
          data: machineController.machineList,
          crossAxisCount: _width < 650 ? 2 : 4,
          childAspectRatio: _width < 1400 ? 1.1 : 1.4,
          childItem: (p0) => MachineGridTile(
            machine: p0,
          ),
        );
      }
    });
  }
}
