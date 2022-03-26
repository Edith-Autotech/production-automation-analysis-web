import 'package:flutter/material.dart';

import '../machine_grid_tile/machine_grid_tile.dart';

import '/constants/controllers.dart';
import '/widgets/grid_view.dart';

class MachinesLargeScreen extends StatelessWidget {
  const MachinesLargeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return CustomGridView(
      data: machineController.machineList,
      crossAxisCount: _width < 650 ? 2 : 4,
      childAspectRatio: _width < 1400 ? 1.1 : 1.4,
      childItem: (p0) => MachineGridTile(
        machine: p0,
      ),
    );
  }
}
