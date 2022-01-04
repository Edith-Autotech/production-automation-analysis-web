import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/constants/controllers.dart';
import '/constants/style.dart';
import '/models/state_enum.dart';
import '/widgets/custom_text.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  void selectDate(BuildContext context) async {
    final dateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.parse(countController.activeDate.value),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    );
    if (dateTime != null) {
      countController.updateActiveDate(dateTime.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: [
          CustomText(
            text: machineController.selectedMachine.value.machineName,
            weight: FontWeight.bold,
            size: 22,
            color: dark,
          ),
          Expanded(child: Container()),
          CustomText(
            text: returnStringFromEnum(
              machineController.selectedMachine.value.state,
            ),
            weight: FontWeight.bold,
            size: defaultPadding,
            color: returnColorFromEnum(
              machineController.selectedMachine.value.state,
            ),
          ),
          Expanded(child: Container()),
          CustomText(
            text: countController.activeDate.value,
            weight: FontWeight.w600,
            size: 18,
          ),
          SizedBox(width: defaultPadding),
          Padding(
            padding: EdgeInsets.only(right: defaultPadding),
            child: IconButton(
              icon: const Icon(
                Icons.date_range,
                size: 30,
              ),
              onPressed: () => selectDate(context),
            ),
          )
        ],
      ),
    );
  }
}
