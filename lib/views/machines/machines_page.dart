import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/constants/controllers.dart';
import '/helper/responsive.dart';
import '/widgets/custom_text.dart';
import '/widgets/loading_spinner.dart';
import '../base_page_layout.dart';
import 'widgets/machine_grid_view/large_screen.dart';
import 'widgets/machine_grid_view/medium_screen.dart';
import 'widgets/machine_grid_view/small_screen.dart';

class MachinesPage extends StatefulWidget {
  const MachinesPage({Key? key}) : super(key: key);

  @override
  State<MachinesPage> createState() => _MachinesPageState();
}

class _MachinesPageState extends State<MachinesPage> {
  @override
  void initState() {
    super.initState();
    if (machineController.machineList.isEmpty) getData();
  }

  Future<void> getData() async {
    // await factoryController.getFactory();
    await machineController.fetchMachines();
  }

  @override
  Widget build(BuildContext context) {
    return BasePageLayout(
      child: Obx(() {
        if (machineController.isLoading.value) {
          return const LoadingSpinner();
        } else if (machineController.machineList.isEmpty) {
          return const Center(child: CustomText("No data"));
        } else {
          return ListView(
            children: [
              if (ResponsiveWidget.isLargeScreen(context) || ResponsiveWidget.isMediumScreen(context))
                if (ResponsiveWidget.isCustomSize(context))
                  const MachinesMediumScreen()
                else
                  const MachinesLargeScreen()
              else
                const MachinesSmallScreen()
            ],
          );
        }
      }),
    );
  }
}
