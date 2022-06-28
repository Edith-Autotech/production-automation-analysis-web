import 'dart:convert';

import '/helper/state_enum.dart';

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

// {
//   "_id": "60edf65464386d85edbf1cf7",
//   "factoryId": "60edf21afe5d80842c2052e3",
//   "machineName": "machine - 6",
//   "parallelState": false,
//   "currentPart_1": "569138",
//   "currentPart_2": null,
//   "currentOperation_1": 2,
//   "currentOperation_2": null,
//   "reasonCode": 2,
//   "state": "Standby",
//   "previousTimeStroke": "00:00:00",
// }

class Machine {
  final String id;
  final String factoryId;
  final String machineName;
  final bool parallelState;
  final String currentPart_1;
  final String? currentPart_2;
  final int currentOperation_1;
  final int? currentOperation_2;
  final int reasonCode;
  final MachineStateEnum state;
  Machine({
    this.id = '',
    this.factoryId = '',
    this.machineName = '',
    this.parallelState = false,
    this.currentPart_1 = '',
    this.currentPart_2,
    this.currentOperation_1 = 0,
    this.currentOperation_2,
    this.reasonCode = 0,
    this.state = MachineStateEnum.standby,
  });

  Machine copyWith({
    String? id,
    String? factoryId,
    String? machineName,
    bool? parallelState,
    String? currentPart_1,
    String? currentPart_2,
    int? currentOperation_1,
    int? currentOperation_2,
    int? reasonCode,
    MachineStateEnum? state,
    String? previousTimeStroke,
  }) {
    return Machine(
      id: id ?? this.id,
      factoryId: factoryId ?? this.factoryId,
      machineName: machineName ?? this.machineName,
      parallelState: parallelState ?? this.parallelState,
      currentPart_1: currentPart_1 ?? this.currentPart_1,
      currentPart_2: currentPart_2 ?? this.currentPart_2,
      currentOperation_1: currentOperation_1 ?? this.currentOperation_1,
      currentOperation_2: currentOperation_2 ?? this.currentOperation_2,
      reasonCode: reasonCode ?? this.reasonCode,
      state: state ?? this.state,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'factoryId': factoryId,
      'machineName': machineName,
      'parallelState': parallelState,
      'currentPart_1': currentPart_1,
      'currentPart_2': currentPart_2,
      'currentOperation_1': currentOperation_1,
      'currentOperation_2': currentOperation_2,
      'reasonCode': reasonCode,
      'state': returnStringFromEnum(state),
    };
  }

  factory Machine.fromMap(Map<String, dynamic> map) {
    // logger.i('Machine.fromMap: $map');
    return Machine(
      id: map['_id'] ?? '',
      factoryId: map['factoryId'] ?? '',
      machineName: map['machineName'] ?? '',
      parallelState: map['parallelState'] ?? false,
      currentPart_1: map['currentPart_1'] ?? '',
      currentPart_2: map['currentPart_2'],
      currentOperation_1: map['currentOperation_1']?.toInt() ?? 0,
      currentOperation_2: map['currentOperation_2']?.toInt(),
      reasonCode: map['reasonCode']?.toInt(),
      state: returnEnumFromString(map['state']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Machine.fromJson(String source) => Machine.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Machine(id: $id, factoryId: $factoryId, machineName: $machineName, parallelState: $parallelState, currentPart_1: $currentPart_1, currentPart_2: $currentPart_2, currentOperation_1: $currentOperation_1, currentOperation_2: $currentOperation_2, reasonCode: $reasonCode, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Machine &&
        other.id == id &&
        other.factoryId == factoryId &&
        other.machineName == machineName &&
        other.parallelState == parallelState &&
        other.currentPart_1 == currentPart_1 &&
        other.currentPart_2 == currentPart_2 &&
        other.currentOperation_1 == currentOperation_1 &&
        other.currentOperation_2 == currentOperation_2 &&
        other.reasonCode == reasonCode &&
        other.state == state;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        factoryId.hashCode ^
        machineName.hashCode ^
        parallelState.hashCode ^
        currentPart_1.hashCode ^
        currentPart_2.hashCode ^
        currentOperation_1.hashCode ^
        currentOperation_2.hashCode ^
        reasonCode.hashCode ^
        state.hashCode;
  }
}
