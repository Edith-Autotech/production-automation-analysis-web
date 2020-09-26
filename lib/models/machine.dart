import 'package:flutter/material.dart';

class Machine {
  final String machineId;
  final String currentPart;
  final String currentOperation;
  final String reasonCode;
  final String previousState;
  final String previousTimeStroke;
  Machine({
    this.machineId,
    this.reasonCode,
    this.currentOperation,
    this.currentPart,
    this.previousState,
    @required this.previousTimeStroke,
  });
}
