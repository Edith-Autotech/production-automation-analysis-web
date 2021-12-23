// import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

enum machineStateEnum {
  production,
  standby,
  idle,
}

machineStateEnum returnEnumFromString(String machineStateString) {
  if (machineStateString == "Production") {
    return machineStateEnum.production;
  } else if (machineStateString == "Standby") {
    return machineStateEnum.standby;
  } else if (machineStateString == "Idle") {
    return machineStateEnum.idle;
  } else {
    return machineStateEnum.production;
  }
}

String? returnStringFromEnum(machineStateEnum stateEnum) {
  if (stateEnum == machineStateEnum.production) {
    return "Production";
  } else if (stateEnum == machineStateEnum.standby) {
    return "Standby";
  } else if (stateEnum == machineStateEnum.idle) {
    return "Idle";
  }
  return null;
}

MaterialColor returnColorFromEnum(machineStateEnum stateEnum) {
  if (stateEnum == machineStateEnum.production) {
    return Colors.green;
  } else if (stateEnum == machineStateEnum.standby) {
    return Colors.red;
  } else if (stateEnum == machineStateEnum.idle) {
    return Colors.yellow;
  }
  return Colors.green;
}

Icon? returnMediaFromEnum(machineStateEnum stateEnum) {
  if (stateEnum == machineStateEnum.production) {
    return Icon(
      Icons.check_circle_outline,
      color: returnColorFromEnum(stateEnum),
    );
  } else if (stateEnum == machineStateEnum.standby) {
    return Icon(
      Icons.pan_tool_rounded,
      color: returnColorFromEnum(stateEnum),
    );
  } else if (stateEnum == machineStateEnum.idle) {
    return Icon(
      Icons.info,
      color: returnColorFromEnum(stateEnum),
    );
  }
  return null;
}
