import 'package:flutter/material.dart';

import '/constants/controllers.dart';
import '/widgets/grid_view.dart';

import '../machine_grid_tile/machine_grid_tile.dart';

class MachinesSmallScreen extends StatelessWidget {
  const MachinesSmallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return CustomGridView(
      data: machineController.machineList,
      crossAxisCount: _width < 650 ? 2 : 4,
      childAspectRatio: _width < 650 && _width > 350 ? 1.3 : 1,
      childItem: (p0) => MachineGridTile(machine: p0),
    );
  }
}
