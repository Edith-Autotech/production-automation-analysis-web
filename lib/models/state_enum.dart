import 'package:flutter/material.dart';
import 'package:production_automation_web/constants/style.dart';

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

String returnStringFromEnum(machineStateEnum stateEnum) {
  if (stateEnum == machineStateEnum.production) {
    return "Production";
  } else if (stateEnum == machineStateEnum.standby) {
    return "Standby";
  } else if (stateEnum == machineStateEnum.idle) {
    return "Idle";
  }
  return "no data";
}

Color returnColorFromEnum(machineStateEnum stateEnum) {
  if (stateEnum == machineStateEnum.production) {
    return production;
  } else if (stateEnum == machineStateEnum.standby) {
    return standby;
  } else if (stateEnum == machineStateEnum.idle) {
    return idle;
  }
  return production;
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
