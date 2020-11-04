import 'package:flutter/material.dart';

class Machine {
  final String id;
  final String name;
  final String parallelState;
  final String currentPart1;
  final String currentPart2;
  final String currentOperation1;
  final String currentOperation2;
  final String reasonCode;
  final String previousState;
  final String previousTimeStroke;
  Machine({
    @required this.id,
    @required this.name,
    @required this.parallelState,
    @required this.reasonCode,
    @required this.currentOperation1,
    @required this.currentPart1,
    @required this.currentOperation2,
    @required this.currentPart2,
    @required this.previousState,
    @required this.previousTimeStroke,
  });
}
