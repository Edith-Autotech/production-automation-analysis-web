import 'package:flutter/material.dart';

import '/constants/style.dart';
import '../../../../helper/state_enum.dart';

class StateCountCard extends StatelessWidget {
  final MachineStateEnum machineState;
  final int stateCount;
  final Color color;
  final bool activeState;
  final String time;
  const StateCountCard({
    Key? key,
    required this.color,
    required this.machineState,
    required this.stateCount,
    required this.time,
    required this.activeState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 136,
          alignment: Alignment.center,
          margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: activeState ? color : light,
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 6),
                color: grey,
                blurRadius: 12,
              )
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(height: 5, color: returnColorFromEnum(machineState)),
                  ),
                ],
              ),
              Expanded(child: Container()),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "${returnStringFromEnum(machineState)}\n\n",
                      style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                        color: dark,
                      ),
                    ),
                    TextSpan(
                      text: "$stateCount\n\n",
                      style: const TextStyle(
                        fontSize: 22,
                        color: dark,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: time,
                      style: const TextStyle(
                        fontSize: 21,
                        color: dark,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}
