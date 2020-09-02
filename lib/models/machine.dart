import 'package:flutter/material.dart';

class Machine {
  final String machineId;
  final String currentPart;
  final String state;
  final String currentOperation;
  Machine({
    this.machineId,
    @required this.state,
    this.currentOperation,
    this.currentPart,
  });
}
