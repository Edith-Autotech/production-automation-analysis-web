enum machineStateEnum {
  production,
  standby,
  idle,
}

machineStateEnum? returnEnumFromString(String machineStateString) {
  if (machineStateString == "Production") {
    return machineStateEnum.production;
  } else if (machineStateString == "Standby") {
    return machineStateEnum.standby;
  } else if (machineStateString == "Idle") {
    return machineStateEnum.idle;
  }
  return null;
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
