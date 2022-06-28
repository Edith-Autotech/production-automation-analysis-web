import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '/constants/controllers.dart';
import '/constants/style.dart';
import '/helper/state_enum.dart';
import '/models/machine.dart';
import '/routes/routes.dart';
import '/widgets/custom_text.dart';
import '../column_template.dart';

class MachineGridTile extends StatelessWidget {
  final Machine machine;
  const MachineGridTile({
    Key? key,
    required this.machine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const outerCircleHeight = 40.0;
    const innerCircleHeight = 20.0;
    final colorBool = machine.state == MachineStateEnum.standby;
    return Padding(
      padding: const EdgeInsets.all(defaultPadding / 2),
      child: InkWell(
        onTap: () {
          machineController.changeSelectedMachine(machine);
          navigationController.navigateTo(dashboardPageDisplayName);
        },
        child: DottedBorder(
          color: lightGrey,
          strokeWidth: 3,
          borderType: BorderType.RRect,
          dashPattern: const [5, 5],
          radius: const Radius.circular(defaultPadding),
          child: Container(
            decoration: BoxDecoration(
              color: returnColorFromEnum(machine.state),
              borderRadius: const BorderRadius.all(Radius.circular(defaultPadding)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding / 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: outerCircleHeight,
                            width: outerCircleHeight,
                            decoration: BoxDecoration(
                              color: light.withOpacity(0.3),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(outerCircleHeight / 2),
                              ),
                            ),
                          ),
                          Positioned(
                            top: innerCircleHeight / 2,
                            left: innerCircleHeight / 2,
                            child: Container(
                              height: innerCircleHeight,
                              width: innerCircleHeight,
                              decoration: const BoxDecoration(
                                color: light,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(innerCircleHeight / 2),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: defaultPadding / 3),
                  CustomText(
                    machine.machineName,
                    color: colorBool ? light : dark,
                    size: 16,
                    weight: FontWeight.w700,
                  ),
                  const SizedBox(height: defaultPadding),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: ColumnTemplate(
                          titleText: "Part 1 Name",
                          subTitleText: machine.currentPart_1.isEmpty ? "No part" : machine.currentPart_1,
                          blackColorOverride: colorBool,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: ColumnTemplate(
                          titleText: "OP No:",
                          subTitleText: machine.currentOperation_1.toString(),
                          blackColorOverride: colorBool,
                        ),
                      ),
                    ],
                  ),
                  if (machine.parallelState)
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: ColumnTemplate(
                            titleText: "Part 2 Name",
                            subTitleText: machine.currentPart_2 != null
                                ? machine.currentPart_2!.isEmpty
                                    ? "No part"
                                    : machine.currentPart_1
                                : "No part",
                            blackColorOverride: colorBool,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: ColumnTemplate(
                            titleText: "OP No:",
                            subTitleText: machine.currentOperation_1.toString(),
                            blackColorOverride: colorBool,
                          ),
                        ),
                      ],
                    )
                  else
                    Container(),
                  const SizedBox(height: defaultPadding),
                  CustomText(
                    "Machine State",
                    color: colorBool ? light : dark,
                    size: 12,
                    weight: FontWeight.w500,
                  ),
                  CustomText(
                    returnStringFromEnum(machine.state),
                    color: colorBool ? light : dark,
                    size: 10,
                    weight: FontWeight.w400,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    // InkWell(
    //   onTap: () {
    //     navigationController.navigateTo(dashboardPageDisplayName);
    //     machineController.changeSelectedMachine(machine);
    //   },
    //   child: Container(
    //     padding: const EdgeInsets.all(10),
    //     decoration: BoxDecoration(
    //       color: lightGrey,
    //       borderRadius: const BorderRadius.all(Radius.circular(10)),
    //     ),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             Container(
    //               height: 40,
    //               width: 40,
    //               decoration: BoxDecoration(
    //                 color: returnColorFromEnum(machine.state).withOpacity(0.1),
    //                 borderRadius: const BorderRadius.all(
    //                   Radius.circular(10),
    //                 ),
    //               ),
    //               child: Center(
    //                 child: returnMediaFromEnum(machine.state),
    //               ),
    //             ),
    //             const Icon(Icons.more_vert, color: Colors.white54)
    //           ],
    //         ),
    //         CustomText(
    //           text: machine.machineName,
    //           color: light,
    //           size: 21,
    //           weight: FontWeight.bold,
    //         ),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             CustomText(
    //               text: machine.currentPart_1.isEmpty ? "No part" : machine.currentPart_1,
    //               color: light.withOpacity(.7),
    //             ),
    //             CustomText(text: "${machine.currentOperation_1}"),
    //           ],
    //         ),
    //         if (machine.parallelState)
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               CustomText(
    //                 text: machine.currentPart_2.isEmpty ? "No part" : machine.currentPart_2,
    //                 color: light.withOpacity(.7),
    //               ),
    //               CustomText(text: "${machine.currentOperation_2}"),
    //             ],
    //           ),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             CustomText(
    //               text: returnStringFromEnum(machine.state),
    //               color: light,
    //             ),
    //             // CustomText(
    //             //   text: machine.previousTimeStroke,
    //             //   color: light,
    //             // ),
    //           ],
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}
