import 'package:flutter/material.dart';

import '/constants/controllers.dart';

import '/helper/responsive.dart';

import '/pages/base_page_layout.dart';

import 'widgets/medium_screen.dart';
import 'widgets/small_screen.dart';
import 'widgets/large_screen.dart';

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
    await factoryController.getFactory();
    await machineController.fetchMachines();
  }

  @override
  Widget build(BuildContext context) {
    return BasePageLayout(
      children: [
        if (ResponsiveWidget.isLargeScreen(context) || ResponsiveWidget.isMediumScreen(context))
          if (ResponsiveWidget.isCustomSize(context)) const MachinesMediumScreen() else const MachinesLargeScreen()
        else
          const MachinesSmallScreen()
      ],
    );
  }
}
