import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/constants/controllers.dart';

import '/widgets/custom_text.dart';

class MachineDataSection extends StatelessWidget {
  const MachineDataSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var machine = machineController.selectedMachine.value;

      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _rowElement("Factory Id", machine.factoryId),
          // _rowElement("Last time stamp", machine.previousTimeStroke),
          _rowElement("Parallel state", machine.parallelState.toString()),
          _rowElement("Part 1", machine.currentPart_1),
          _rowElement("Operation", machine.currentOperation_1.toString()),
          if (machine.parallelState)
            _rowElement(
              "Part 2",
              machine.currentPart_2,
            )
          else
            Container(),
          if (machine.parallelState)
            _rowElement(
              "Operation",
              machine.currentOperation_2.toString(),
            )
          else
            Container(),
        ],
      );
    });
  }

  Widget _rowElement(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(text: title),
        CustomText(text: value),
      ],
    );
  }
}
