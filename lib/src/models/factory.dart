import 'dart:convert';

// ? Factory Model

// * ---------------------------RESPONSE--------------------------
//   {
//         "_id": "60edf209fe5d80842c2052e0",
//         "userId": "610b93515f0635ab09ceb742",
//         "factoryName": "Saptasatij-2.0"
//       }
// * -----------------------------------------------------------------------

class FactoryModel {
  final String factoryId;
  final String factoryName;
  final String userId;
  FactoryModel({
    required this.factoryId,
    required this.factoryName,
    required this.userId,
  });

  FactoryModel copyWith({
    String? factoryId,
    String? factoryName,
    String? userId,
  }) {
    return FactoryModel(
      factoryId: factoryId ?? this.factoryId,
      factoryName: factoryName ?? this.factoryName,
      userId: userId ?? this.userId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'factoryId': factoryId,
      'factoryName': factoryName,
      'userId': userId,
    };
  }

  factory FactoryModel.fromMap(Map<String, dynamic> map) {
    return FactoryModel(
      factoryId: map['_id'],
      factoryName: map['factoryName'],
      userId: map['userId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FactoryModel.fromJson(String source) => FactoryModel.fromMap(json.decode(source));

  @override
  String toString() => 'FactoryModel(factoryId: $factoryId, factoryName: $factoryName, userId: $userId)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FactoryModel &&
        other.factoryId == factoryId &&
        other.factoryName == factoryName &&
        other.userId == userId;
  }

  @override
  int get hashCode => factoryId.hashCode ^ factoryName.hashCode ^ userId.hashCode;
}
