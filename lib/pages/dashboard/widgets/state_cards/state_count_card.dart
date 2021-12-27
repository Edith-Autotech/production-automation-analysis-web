import 'package:flutter/material.dart';

import '/constants/style.dart';
import '/models/state_enum.dart';

class StateCountCard extends StatelessWidget {
  final machineStateEnum machineState;
  final int stateCount;
  final String time;
  const StateCountCard({
    Key? key,
    required this.machineState,
    required this.stateCount,
    required this.time,
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
            color: lightGrey.withOpacity(.3),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 6),
                color: lightGrey.withOpacity(.1),
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
                      child: Container(
                    height: 5,
                    color: returnColorFromEnum(machineState),
                  )),
                ],
              ),
              Expanded(child: Container()),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "${returnStringFromEnum(machineState)}\n\n",
                      style: TextStyle(
                        fontSize: 17,
                        color: dark.withOpacity(.6),
                      ),
                    ),
                    TextSpan(
                      text: "$stateCount\n\n",
                      style: TextStyle(
                        fontSize: 22,
                        color: dark,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: time,
                      style: TextStyle(
                        fontSize: 21,
                        color: dark.withOpacity(.4),
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
