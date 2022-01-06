import 'package:flutter/material.dart';

import '/constants/style.dart';
import '../../../../helper/state_enum.dart';
import '/widgets/custom_text.dart';

class StateCountCardSmall extends StatelessWidget {
  final machineStateEnum machineState;
  final int stateCount;
  const StateCountCardSmall({
    Key? key,
    required this.machineState,
    required this.stateCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: lightGrey,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 6),
                color: lightGrey.withOpacity(.1),
                blurRadius: 12,
              )
            ],
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 2, color: light),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: returnStringFromEnum(machineState),
                size: 24,
                weight: FontWeight.w300,
                color: light,
              ),
              CustomText(
                text: stateCount.toString(),
                size: 24,
                weight: FontWeight.w300,
                color: light,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
