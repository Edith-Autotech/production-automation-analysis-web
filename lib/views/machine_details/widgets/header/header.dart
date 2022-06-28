import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/constants/controllers.dart';
import '/constants/style.dart';
import '/widgets/custom_text.dart';

class MachineDetailsHeader extends StatelessWidget {
  const MachineDetailsHeader({Key? key}) : super(key: key);

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
    return Obx(() {
      return Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () => selectDate(context),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: lightGrey, width: 0.3),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(Icons.date_range, size: 20, color: active),
                      CustomText(
                        countController.activeDate.value,
                        color: active,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: defaultPadding),
              CustomText(
                machineController.selectedMachine.value.machineName,
                weight: FontWeight.bold,
                size: 25,
                color: dark,
              ),
            ],
          ),
          Expanded(child: Container()),
        ],
      );
    });
  }
}
