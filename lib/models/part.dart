import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'stock.dart';

// ? Part Model

// * ---------------------------RESPONSE--------------------------
//    {
//         "_id": "60ef41ffc52f4931b44dc0e4",
//         "factoryId": "60edf21afe5d80842c2052e3",
//         "companyName": "TATA-Motors",
//         "noOfOperations": 4,
//         "partName": "Hood",
//         "partNumber": "TATA-123",
//         "stock": [
//           {
//             "_id": "60ef41ffc52f4931b44dc0e6",
//             "stock": -24,
//             "operationNumber": 1
//           },
//           {
//             "_id": "60ef41ffc52f4931b44dc0e9",
//             "stock": 0,
//             "operationNumber": 4
//           },
// * -----------------------------------------------------------------------

class Part {
  final String partId;
  final String factoryId;
  final String companyName;
  final int noOfOperations;
  final String partName;
  final String partNumber;
  final List<Stock>? stock;
  Part({
    this.partId = "",
    this.factoryId = "",
    this.companyName = "",
    this.noOfOperations = 0,
    this.partName = "",
    this.partNumber = "",
    this.stock,
  });

  Part copyWith({
    String? partId,
    String? factoryId,
    String? companyName,
    int? noOfOperations,
    String? partName,
    String? partNumber,
    List<Stock>? stock,
  }) {
    return Part(
      partId: partId ?? this.partId,
      factoryId: factoryId ?? this.factoryId,
      companyName: companyName ?? this.companyName,
      noOfOperations: noOfOperations ?? this.noOfOperations,
      partName: partName ?? this.partName,
      partNumber: partNumber ?? this.partNumber,
      stock: stock ?? this.stock,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'partId': partId,
      'factoryId': factoryId,
      'companyName': companyName,
      'noOfOperations': noOfOperations,
      'partName': partName,
      'partNumber': partNumber,
      'stock': stock!.map((x) => x.toMap()).toList(),
    };
  }

  factory Part.fromMap(Map<String, dynamic> map) {
    // print(map['stock']);
    return Part(
      partId: map['_id'],
      factoryId: map['factoryId'],
      companyName: map['companyName'],
      noOfOperations: map['noOfOperations'],
      partName: map['partName'],
      partNumber: map['partNumber'],
      stock: List<Stock>.from(map['stock']?.map((x) => Stock.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Part.fromJson(String source) => Part.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Part(partId: $partId, factoryId: $factoryId, companyName: $companyName, noOfOperations: $noOfOperations, partName: $partName, partNumber: $partNumber), stock: $stock)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Part &&
        other.partId == partId &&
        other.factoryId == factoryId &&
        other.companyName == companyName &&
        other.noOfOperations == noOfOperations &&
        other.partName == partName &&
        other.partNumber == partNumber &&
        listEquals(other.stock, stock);
  }

  @override
  int get hashCode {
    return partId.hashCode ^
        factoryId.hashCode ^
        companyName.hashCode ^
        noOfOperations.hashCode ^
        partName.hashCode ^
        partNumber.hashCode ^
        stock.hashCode;
  }
}
