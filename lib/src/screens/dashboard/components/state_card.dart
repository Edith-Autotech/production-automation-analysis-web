import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:production_automation_web/constants.dart';
// import 'package:production_automation_web/src/models/MyFiles.dart';
import 'package:production_automation_web/src/models/machine.dart';
import 'package:production_automation_web/src/models/state_enum.dart';
import 'package:production_automation_web/src/routes/routes.dart';
import 'package:production_automation_web/src/screens/dashboard/dashboard.dart';
import 'package:production_automation_web/src/widgets/label/label.dart';

class StateCard extends StatelessWidget {
  const StateCard({
    Key? key,
    required this.token,
  }) : super(key: key);

  final String token;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Constants.defaultPadding),
      decoration: const BoxDecoration(
        color: Constants.secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Container(
          //       height: 40,
          //       width: 40,
          //       decoration: BoxDecoration(
          //         color: returnColorFromEnum(machine.state).withOpacity(0.1),
          //         borderRadius: const BorderRadius.all(
          //           Radius.circular(10),
          //         ),
          //       ),
          //       child: Center(
          //         child: returnMediaFromEnum(machine.state),
          //       ),
          //     ),
          //     const Icon(Icons.more_vert, color: Colors.white54)
          //   ],
          // ),
          // Text(
          //   machine.machineName,
          //   maxLines: 1,
          //   overflow: TextOverflow.ellipsis,
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(
          //       machine.currentPart_1,
          //       style: Theme.of(context).textTheme.caption!.copyWith(
          //             color: Colors.white60,
          //           ),
          //     ),
          //     Text(
          //       "${machine.currentOperation_1}",
          //       style: Theme.of(context).textTheme.caption!.copyWith(
          //             color: Colors.white54,
          //           ),
          //     ),
          //   ],
          // ),
          // if (machine.parallelState)
          //   Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       label(machine.currentPart_2),
          //       Text(
          //         "${machine.currentOperation_2}",
          //         style: Theme.of(context).textTheme.caption!.copyWith(
          //               color: Colors.white54,
          //             ),
          //       ),
          //     ],
          //   ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(
          //       "${returnStringFromEnum(machine.state)}",
          //       style: Theme.of(context).textTheme.caption!.copyWith(
          //             color: Colors.white70,
          //           ),
          //     ),
          //     Text(
          //       machine.previousTimeStroke,
          //       style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.white),
          //     ),
          //   ],
          // )
        ],
      ),
    );
  }
}
