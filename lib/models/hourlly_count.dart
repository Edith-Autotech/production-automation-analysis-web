import 'dart:convert';
// ? Hourly Count Model

// * ---------------------------RESPONSE--------------------------
//           {
//             "timeRange": " 22 - 23",
//             "productionCount": 6,
//             "standbyCount": 0,
//             "idleCount": 1
//
// * -----------------------------------------------------------------------

class HourlyCount {
  final String timeRange;
  final int productionCount;
  final int idleCount;
  final int standbyCount;
  HourlyCount({
    required this.timeRange,
    required this.productionCount,
    required this.idleCount,
    required this.standbyCount,
  });

  HourlyCount copyWith({
    String? timeRange,
    int? productionCount,
    int? idleCount,
    int? standbyCount,
  }) {
    return HourlyCount(
      timeRange: timeRange ?? this.timeRange,
      productionCount: productionCount ?? this.productionCount,
      idleCount: idleCount ?? this.idleCount,
      standbyCount: standbyCount ?? this.standbyCount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'timeRange': timeRange,
      'productionCount': productionCount,
      'idleCount': idleCount,
      'standbyCount': standbyCount,
    };
  }

  factory HourlyCount.fromMap(Map<String, dynamic> map) {
    // print(map);
    return HourlyCount(
      timeRange: map['timeRange'],
      productionCount: map['productionCount'],
      idleCount: map['idleCount'],
      standbyCount: map['standbyCount'],
    );
  }

  String toJson() => json.encode(toMap());

  factory HourlyCount.fromJson(String source) => HourlyCount.fromMap(json.decode(source));

  @override
  String toString() {
    return 'HourlyCount(timeRange: $timeRange, productionCount: $productionCount, idleCount: $idleCount, standbyCount: $standbyCount)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HourlyCount &&
        other.timeRange == timeRange &&
        other.productionCount == productionCount &&
        other.idleCount == idleCount &&
        other.standbyCount == standbyCount;
  }

  @override
  int get hashCode {
    return timeRange.hashCode ^ productionCount.hashCode ^ idleCount.hashCode ^ standbyCount.hashCode;
  }
}
