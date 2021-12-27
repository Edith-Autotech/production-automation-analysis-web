import 'dart:convert';
// ? Reason Model

// * ---------------------------RESPONSE--------------------------
//   {
//         "_id": "610eda98180d0f9539f535be",
//         "reasonCode": 0,
//         "reasonDescription": "production state"
//       },
// * -----------------------------------------------------------------------

class Reason {
  final String reasonId;
  final int reasonCode;
  final String reasonDescription;

  Reason({
    required this.reasonId,
    required this.reasonCode,
    required this.reasonDescription,
  });

  Reason copyWith({
    String? reasonId,
    int? reasonCode,
    String? reasonDescription,
  }) {
    return Reason(
      reasonId: reasonId ?? this.reasonId,
      reasonCode: reasonCode ?? this.reasonCode,
      reasonDescription: reasonDescription ?? this.reasonDescription,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'reasonId': reasonId,
      'reasonCode': reasonCode,
      'reasonDescription': reasonDescription,
    };
  }

  factory Reason.fromMap(Map<String, dynamic> map) {
    return Reason(
      reasonId: map['_id'],
      reasonCode: map['reasonCode'],
      reasonDescription: map['reasonDescription'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Reason.fromJson(String source) => Reason.fromMap(json.decode(source));

  @override
  String toString() => 'Reason(reasonId: $reasonId, reasonCode: $reasonCode, reasonDescription: $reasonDescription)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Reason &&
        other.reasonId == reasonId &&
        other.reasonCode == reasonCode &&
        other.reasonDescription == reasonDescription;
  }

  @override
  int get hashCode => reasonId.hashCode ^ reasonCode.hashCode ^ reasonDescription.hashCode;
}
