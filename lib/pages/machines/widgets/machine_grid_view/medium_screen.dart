import 'package:flutter/material.dart';

import '/constants/controllers.dart';
import '/widgets/grid_view.dart';

import '../grid_tile/machine_grid_tile.dart';

class MachinesMediumScreen extends StatelessWidget {
  const MachinesMediumScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomGridView(
      data: machineController.machineList,
      childItem: (p0) => MachineGridTile(machine: p0),
    );
  }
}
