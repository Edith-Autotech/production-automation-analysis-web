import 'dart:convert';

// ? Factory Model

// * ---------------------------RESPONSE--------------------------
//   {
//         "_id": "60edf209fe5d80842c2052e0",
//         "userId": "610b93515f0635ab09ceb742",
//         "factoryName": "Saptasatij-2.0"
//       }
// * -----------------------------------------------------------------------

class Factory {
  final String factoryId;
  final String factoryName;
  Factory({
    this.factoryId = "",
    this.factoryName = "",
  });

  Factory copyWith({
    String? factoryId,
    String? factoryName,
    String? userId,
  }) {
    return Factory(
      factoryId: factoryId ?? this.factoryId,
      factoryName: factoryName ?? this.factoryName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'factoryId': factoryId,
      'factoryName': factoryName,
    };
  }

  factory Factory.fromMap(Map<String, dynamic> map) {
    return Factory(
      factoryId: map['_id'],
      factoryName: map['factoryName'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Factory.fromJson(String source) => Factory.fromMap(json.decode(source));

  @override
  String toString() => 'FactoryModel(factoryId: $factoryId, factoryName: $factoryName)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Factory && other.factoryId == factoryId && other.factoryName == factoryName;
  }

  @override
  int get hashCode => factoryId.hashCode ^ factoryName.hashCode;
}
