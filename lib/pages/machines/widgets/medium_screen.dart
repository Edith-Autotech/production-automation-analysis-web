import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/widgets/custom_text.dart';
import '/widgets/loading_spinner.dart';

import '/constants/controllers.dart';
import '/widgets/grid_view.dart';

import 'machine_grid_tile.dart';

class MachinesMediumScreen extends StatelessWidget {
  const MachinesMediumScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (machineController.isLoading.value) {
        return loadingSpinner(context);
      } else if (machineController.machineList.isEmpty) {
        return const Center(child: CustomText(text: "No data"));
      } else {
        return CustomGridView(
          data: machineController.machineList,
          childItem: (p0) => MachineGridTile(machine: p0),
        );
      }
    });
  }
}
