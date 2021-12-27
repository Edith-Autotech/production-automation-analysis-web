import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/constants/controllers.dart';

import '/models/state_enum.dart';
import 'state_count_card.dart';

class StateCardsLargeScreen extends StatelessWidget {
  const StateCardsLargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Obx(
      () => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          StateCountCard(
            machineState: machineStateEnum.production,
            stateCount: countController.todaysCount.value.productionCount,
            time: countController.todaysCount.value.productionTime,
          ),
          SizedBox(width: _width / 64),
          StateCountCard(
            machineState: machineStateEnum.idle,
            stateCount: countController.todaysCount.value.idleCount,
            time: countController.todaysCount.value.idleTime,
          ),
          SizedBox(width: _width / 64),
          StateCountCard(
            machineState: machineStateEnum.standby,
            stateCount: countController.todaysCount.value.standbyCount,
            time: countController.todaysCount.value.standbyTime,
          ),
        ],
      ),
    );
  }
}
