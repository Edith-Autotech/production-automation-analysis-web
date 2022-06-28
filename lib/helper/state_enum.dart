import 'package:flutter/material.dart';

import '/constants/style.dart';

enum MachineStateEnum {
  production,
  standby,
  idle,
}

MachineStateEnum returnEnumFromString(String machineStateString) {
  if (machineStateString == "Production") {
    return MachineStateEnum.production;
  } else if (machineStateString == "Standby") {
    return MachineStateEnum.standby;
  } else if (machineStateString == "Idle") {
    return MachineStateEnum.idle;
  } else {
    return MachineStateEnum.production;
  }
}

String returnStringFromEnum(MachineStateEnum stateEnum) {
  if (stateEnum == MachineStateEnum.production) {
    return "Production";
  } else if (stateEnum == MachineStateEnum.standby) {
    return "Standby";
  } else if (stateEnum == MachineStateEnum.idle) {
    return "Idle";
  }
  return "no data";
}

Color returnColorFromEnum(MachineStateEnum stateEnum) {
  if (stateEnum == MachineStateEnum.production) {
    return productionColor;
  } else if (stateEnum == MachineStateEnum.standby) {
    return standbyColor;
  } else if (stateEnum == MachineStateEnum.idle) {
    return idleColor;
  }
  return productionColor;
}

Icon? returnMediaFromEnum(MachineStateEnum stateEnum) {
  if (stateEnum == MachineStateEnum.production) {
    return Icon(
      Icons.check_circle_outline,
      color: returnColorFromEnum(stateEnum),
    );
  } else if (stateEnum == MachineStateEnum.standby) {
    return Icon(
      Icons.pan_tool_rounded,
      color: returnColorFromEnum(stateEnum),
    );
  } else if (stateEnum == MachineStateEnum.idle) {
    return Icon(
      Icons.info,
      color: returnColorFromEnum(stateEnum),
    );
  }
  return null;
}
