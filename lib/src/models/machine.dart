import 'dart:convert';

import '/src/models/state_enum.dart';
// ? Machine Model

// * ---------------------------RESPONSE--------------------------
//    {
//         "factoryId": "60edf21afe5d80842c2052e3",
//         "machineName": "machine-1",
//         "parallelState": false,
//         "currentPart_1": "TATA-123",
//         "currentPart_2": null,
//         "currentOperation_1": 2,
//         "currentOperation_2": null,
//         "reasonCode": 0,
//         "state": "standby",
//         "previousTimeStroke": "00:00:00"
//       },
// * -----------------------------------------------------------------------

class Machine {
  final String id;
  final String? name;
  final String factoryId;
  final bool parallelState;
  final String currentPart1;
  final String? currentPart2;
  final int currentOperation1;
  final int? currentOperation2;
  final int reasonCode;
  final machineStateEnum state;
  final String previousTimeStroke;
  Machine({
    required this.id,
    required this.name,
    required this.factoryId,
    required this.parallelState,
    required this.currentPart1,
    this.currentPart2,
    required this.currentOperation1,
    this.currentOperation2,
    required this.reasonCode,
    required this.state,
    required this.previousTimeStroke,
  });

  Machine copyWith({
    String? id,
    String? name,
    String? factoryId,
    bool? parallelState,
    String? currentPart1,
    String? currentPart2,
    int? currentOperation1,
    int? currentOperation2,
    int? reasonCode,
    machineStateEnum? state,
    String? previousTimeStroke,
  }) {
    return Machine(
      id: id ?? this.id,
      name: name ?? this.name,
      factoryId: factoryId ?? this.factoryId,
      parallelState: parallelState ?? this.parallelState,
      currentPart1: currentPart1 ?? this.currentPart1,
      currentPart2: currentPart2 ?? this.currentPart2,
      currentOperation1: currentOperation1 ?? this.currentOperation1,
      currentOperation2: currentOperation2 ?? this.currentOperation2,
      reasonCode: reasonCode ?? this.reasonCode,
      state: state ?? this.state,
      previousTimeStroke: previousTimeStroke ?? this.previousTimeStroke,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'factoryId': factoryId,
      'parallelState': parallelState,
      'currentPart1': currentPart1,
      'currentPart2': currentPart2,
      'currentOperation1': currentOperation1,
      'currentOperation2': currentOperation2,
      'reasonCode': reasonCode,
      'state': state,
      'previousTimeStroke': previousTimeStroke,
    };
  }

  factory Machine.fromMap(Map<String, dynamic> map) {
// {
//         "_id": "60edf65464386d85edbf1cf7",
//         "factoryId": "60edf21afe5d80842c2052e3",
//         "machineName": "machine-1",
//         "parallelState": false,
//         "currentPart_1": "TATA-123",
//         "currentPart_2": null,
//         "currentOperation_1": 2,
//         "currentOperation_2": null,
//         "reasonCode": 0,
//         "state": "standby",
//         "previousTimeStroke": "00:00:00"
//       }
    return Machine(
      id: map['_id'],
      name: map['machineName'],
      factoryId: map['factoryId'],
      parallelState: map['parallelState'],
      currentPart1: map['currentPart_1'],
      currentPart2: map['currentPart_2'],
      currentOperation1: map['currentOperation_1'],
      currentOperation2: map['currentOperation_2'],
      reasonCode: map['reasonCode'],
      state: returnEnumFromString(map['state'])!,
      previousTimeStroke: map['previousTimeStroke'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Machine.fromJson(String source) => Machine.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Machine(id: $id, name: $name, factoryId: $factoryId, parallelState: $parallelState, currentPart1: $currentPart1, currentPart2: $currentPart2, currentOperation1: $currentOperation1, currentOperation2: $currentOperation2, reasonCode: $reasonCode, state: $state, previousTimeStroke: $previousTimeStroke)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Machine &&
        other.id == id &&
        other.name == name &&
        other.factoryId == factoryId &&
        other.parallelState == parallelState &&
        other.currentPart1 == currentPart1 &&
        other.currentPart2 == currentPart2 &&
        other.currentOperation1 == currentOperation1 &&
        other.currentOperation2 == currentOperation2 &&
        other.reasonCode == reasonCode &&
        other.state == state &&
        other.previousTimeStroke == previousTimeStroke;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        factoryId.hashCode ^
        parallelState.hashCode ^
        currentPart1.hashCode ^
        currentPart2.hashCode ^
        currentOperation1.hashCode ^
        currentOperation2.hashCode ^
        reasonCode.hashCode ^
        state.hashCode ^
        previousTimeStroke.hashCode;
  }
}
