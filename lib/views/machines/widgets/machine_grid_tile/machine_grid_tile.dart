import 'package:flutter/material.dart';

import '/constants/controllers.dart';
import '/constants/style.dart';

import '/models/machine.dart';
import '../../../../helper/state_enum.dart';

import '/widgets/custom_text.dart';

import '/routes/routes.dart';

class MachineGridTile extends StatelessWidget {
  final Machine machine;
  const MachineGridTile({
    Key? key,
    required this.machine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigationController.navigateTo(dashboardPageDisplayName);
        machineController.changeSelectedMachine(machine);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: lightGrey,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: returnColorFromEnum(machine.state).withOpacity(0.1),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Center(
                    child: returnMediaFromEnum(machine.state),
                  ),
                ),
                const Icon(Icons.more_vert, color: Colors.white54)
              ],
            ),
            CustomText(
              text: machine.machineName,
              color: light,
              size: 21,
              weight: FontWeight.bold,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: machine.currentPart_1.isEmpty ? "No part" : machine.currentPart_1,
                  color: light.withOpacity(.7),
                ),
                CustomText(text: "${machine.currentOperation_1}"),
              ],
            ),
            if (machine.parallelState)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: machine.currentPart_2.isEmpty ? "No part" : machine.currentPart_2,
                    color: light.withOpacity(.7),
                  ),
                  CustomText(text: "${machine.currentOperation_2}"),
                ],
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: returnStringFromEnum(machine.state),
                  color: light,
                ),
                // CustomText(
                //   text: machine.previousTimeStroke,
                //   color: light,
                // ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
