import 'dart:convert';
import 'package:flutter/foundation.dart';
import '/src/models/hourly_count.dart';

// ? Count model

// * ---------------------------RESPONSE--------------------------
//    {
//         "_id": "6100386aa17a000015b52a7d",
//         "machineId": "60edf65464386d85edbf1cf7",
//         "date": "2021-07-27T00:00:00.000Z",
//         "count": 7,
//         "standbyCount": 0,
//         "productionCount": 6,
//         "idleCount": 1,
//         "productionTime": "00:05:00",
//         "idleTime": "00:00:50",
//         "standbyTime": "00:00:00",
//         "hourlyCount": [
//           {
//             "timeRange": " 22 - 23",
//             "productionCount": 6,
//             "standbyCount": 0,
//             "idleCount": 1
//           }
//         ]
//       }
// * ----------------------------------------------------------------

class CountModel {
  final String? date;
  final int? count;
  final int? standbyCount;
  final int? productionCount;
  final int? idleCount;
  final String? idleTime;
  final String? productionTime;
  final String? standbyTime;
  final List<HourlyCount>? hourlyCount;
  CountModel({
    this.date,
    this.count,
    this.standbyCount,
    this.productionCount,
    this.idleCount,
    this.idleTime,
    this.productionTime,
    this.standbyTime,
    this.hourlyCount,
  });

  CountModel copyWith({
    String? date,
    int? count,
    int? standbyCount,
    int? productionCount,
    int? idleCount,
    String? idleTime,
    String? productionTime,
    String? standbyTime,
    List<HourlyCount>? hourlyCount,
  }) {
    return CountModel(
      date: date ?? this.date,
      count: count ?? this.count,
      standbyCount: standbyCount ?? this.standbyCount,
      productionCount: productionCount ?? this.productionCount,
      idleCount: idleCount ?? this.idleCount,
      idleTime: idleTime ?? this.idleTime,
      productionTime: productionTime ?? this.productionTime,
      standbyTime: standbyTime ?? this.standbyTime,
      hourlyCount: hourlyCount ?? this.hourlyCount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'count': count,
      'standbyCount': standbyCount,
      'productionCount': productionCount,
      'idleCount': idleCount,
      'idleTime': idleTime,
      'productionTime': productionTime,
      'standbyTime': standbyTime,
      'hourlyCount': hourlyCount?.map((x) => x.toMap()).toList(),
    };
  }

  factory CountModel.fromMap(Map<String, dynamic> map) {
    return CountModel(
      date: map['date'],
      count: map['count'],
      standbyCount: map['standbyCount'],
      productionCount: map['productionCount'],
      idleCount: map['idleCount'],
      idleTime: map['idleTime'],
      productionTime: map['productionTime'],
      standbyTime: map['standbyTime'],
      hourlyCount: List<HourlyCount>.from(map['hourlyCount']?.map((x) => HourlyCount.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CountModel.fromJson(String source) => CountModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CountModel(date: $date, count: $count, standbyCount: $standbyCount, productionCount: $productionCount, idleCount: $idleCount, idleTime: $idleTime, productionTime: $productionTime, standbyTime: $standbyTime, hourlyCount: $hourlyCount)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CountModel &&
        other.date == date &&
        other.count == count &&
        other.standbyCount == standbyCount &&
        other.productionCount == productionCount &&
        other.idleCount == idleCount &&
        other.idleTime == idleTime &&
        other.productionTime == productionTime &&
        other.standbyTime == standbyTime &&
        listEquals(other.hourlyCount, hourlyCount);
  }

  @override
  int get hashCode {
    return date.hashCode ^
        count.hashCode ^
        standbyCount.hashCode ^
        productionCount.hashCode ^
        idleCount.hashCode ^
        idleTime.hashCode ^
        productionTime.hashCode ^
        standbyTime.hashCode ^
        hourlyCount.hashCode;
  }
}
