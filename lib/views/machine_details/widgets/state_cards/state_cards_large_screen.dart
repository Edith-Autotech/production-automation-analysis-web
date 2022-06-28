import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/constants/controllers.dart';
import '/helper/state_enum.dart';
import '/widgets/custom_text.dart';
import 'state_count_card.dart';

class StateCardsLargeScreen extends StatelessWidget {
  const StateCardsLargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Obx(() {
      if (countController.todaysCount.value == null) {
        return const Center(
          child: CustomText(
            "No Data for the selected date",
            weight: FontWeight.w700,
            size: 23,
          ),
        );
      } else {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Spacer(),
            StateCountCard(
              machineState: MachineStateEnum.production,
              stateCount: countController.todaysCount.value!.productionCount,
              time: countController.todaysCount.value!.productionTime,
              color: returnColorFromEnum(MachineStateEnum.production),
              activeState: machineController.selectedMachine.value.state == MachineStateEnum.production,
            ),
            SizedBox(width: _width / 64),
            StateCountCard(
              machineState: MachineStateEnum.idle,
              stateCount: countController.todaysCount.value!.idleCount,
              time: countController.todaysCount.value!.idleTime,
              color: returnColorFromEnum(MachineStateEnum.idle),
              activeState: machineController.selectedMachine.value.state == MachineStateEnum.idle,
            ),
            SizedBox(width: _width / 64),
            StateCountCard(
              machineState: MachineStateEnum.standby,
              stateCount: countController.todaysCount.value!.standbyCount,
              time: countController.todaysCount.value!.standbyTime,
              color: returnColorFromEnum(MachineStateEnum.standby),
              activeState: machineController.selectedMachine.value.state == MachineStateEnum.standby,
            ),
            const Spacer(),
          ],
        );
      }
    });
  }
}
