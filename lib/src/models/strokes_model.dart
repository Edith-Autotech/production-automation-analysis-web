import 'dart:convert';

import 'package:charts_flutter/flutter.dart' as charts;
// ? Strokes model for chart creation


class StrokesModel {
  final String? timeRange;
  final int? strokes;
  final charts.Color? barColor;
  StrokesModel({
    this.timeRange,
    this.strokes,
    this.barColor,
  });

  StrokesModel copyWith({
    String? timeRange,
    int? strokes,
    charts.Color? barColor,
  }) {
    return StrokesModel(
      timeRange: timeRange ?? this.timeRange,
      strokes: strokes ?? this.strokes,
      barColor: barColor ?? this.barColor,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'timeRange': timeRange,
      'strokes': strokes,
      'barColor': barColor,
    };
  }

  factory StrokesModel.fromMap(Map<String, dynamic> map) {
    return StrokesModel(
      timeRange: map['timeRange'],
      strokes: map['strokes'],
      barColor: map['barColor'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StrokesModel.fromJson(String source) =>
      StrokesModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'StrokesModel(timeRange: $timeRange, strokes: $strokes, barColor: $barColor)';

  @override
  // ignore: avoid_renaming_method_parameters
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is StrokesModel &&
        o.timeRange == timeRange &&
        o.strokes == strokes &&
        o.barColor == barColor;
  }

  @override
  int get hashCode => timeRange.hashCode ^ strokes.hashCode ^ barColor.hashCode;
}
