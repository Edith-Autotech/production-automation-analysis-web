// To parse this JSON data, do
//
//     final count = countFromMap(jsonString);

import 'dart:convert';

import '/models/hourlly_count.dart';

Count countFromMap(String str) => Count.fromMap(json.decode(str));

String countToMap(Count data) => json.encode(data.toMap());

class Count {
  final String previousTimeStroke;
  final String id;
  final String machineId;
  final DateTime? date;
  final int count;
  final int standbyCount;
  final int productionCount;
  final int idleCount;
  final String productionTime;
  final String idleTime;
  final String standbyTime;
  final List<HourlyCount>? hourlyCount;

  Count({
    this.previousTimeStroke = "00:00:00",
    this.id = "",
    this.machineId = "",
    this.date,
    this.count = 0,
    this.standbyCount = 0,
    this.productionCount = 0,
    this.idleCount = 0,
    this.productionTime = "00:00:00",
    this.idleTime = "00:00:00",
    this.standbyTime = "00:00:00",
    this.hourlyCount,
  });

  Count copyWith({
    String? id,
    String? machineId,
    DateTime? date,
    int? count,
    int? standbyCount,
    int? productionCount,
    int? idleCount,
    String? productionTime,
    String? idleTime,
    String? standbyTime,
    List<HourlyCount>? hourlyCount,
    String? previousTimeStroke,
  }) =>
      Count(
        id: id ?? this.id,
        machineId: machineId ?? this.machineId,
        date: date ?? this.date,
        count: count ?? this.count,
        standbyCount: standbyCount ?? this.standbyCount,
        productionCount: productionCount ?? this.productionCount,
        idleCount: idleCount ?? this.idleCount,
        productionTime: productionTime ?? this.productionTime,
        idleTime: idleTime ?? this.idleTime,
        standbyTime: standbyTime ?? this.standbyTime,
        hourlyCount: hourlyCount ?? this.hourlyCount,
        previousTimeStroke: previousTimeStroke ?? this.previousTimeStroke,
      );

  factory Count.fromMap(Map<String, dynamic> json) {
    // print(json);
    return Count(
      id: json["_id"],
      machineId: json["machineId"],
      date: DateTime.parse(json["date"]),
      count: json["count"],
      standbyCount: json["standbyCount"],
      productionCount: json["productionCount"],
      idleCount: json["idleCount"],
      productionTime: json["productionTime"],
      idleTime: json["idleTime"],
      standbyTime: json["standbyTime"],
      hourlyCount: List<HourlyCount>.from(json["hourlyCount"].map((x) => HourlyCount.fromMap(x))),
      previousTimeStroke: json["previousTimeStroke"],
    );
  }

  Map<String, dynamic> toMap() => {
        "_id": id,
        "machineId": machineId,
        "date": date?.toIso8601String(),
        "count": count,
        "standbyCount": standbyCount,
        "productionCount": productionCount,
        "idleCount": idleCount,
        "productionTime": productionTime,
        "idleTime": idleTime,
        "standbyTime": standbyTime,
        "hourlyCount": List<dynamic>.from(hourlyCount!.map((x) => x.toMap())),
        "previousTimeStroke": previousTimeStroke,
      };
}
