import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/constants/controllers.dart';
import '../../../../helper/state_enum.dart';
import 'state_count_card_small.dart';

class StateCardsSmallScreen extends StatelessWidget {
  const StateCardsSmallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Obx(
      () => SizedBox(
        height: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            StateCountCardSmall(
              machineState: machineStateEnum.production,
              stateCount: countController.todaysCount.value.productionCount,
            ),
            SizedBox(width: _width / 64),
            StateCountCardSmall(
              machineState: machineStateEnum.idle,
              stateCount: countController.todaysCount.value.idleCount,
            ),
            SizedBox(width: _width / 64),
            StateCountCardSmall(
              machineState: machineStateEnum.standby,
              stateCount: countController.todaysCount.value.standbyCount,
            ),
          ],
        ),
      ),
    );
  }
}
