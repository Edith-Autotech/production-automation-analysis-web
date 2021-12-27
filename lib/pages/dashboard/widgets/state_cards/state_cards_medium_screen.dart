import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/constants/controllers.dart';
import '/models/state_enum.dart';
import 'state_count_card.dart';

class StateCardsMediumScreen extends StatelessWidget {
  const StateCardsMediumScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Obx(
      () => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
            ],
          ),
          const SizedBox(height: 16),
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
