import 'package:charts_flutter/flutter.dart' as charts;

class StrokesModel {
  final String xAxis;
  final int strokes;
  final charts.Color barColor;
  StrokesModel({
    this.barColor,
    this.xAxis,
    this.strokes,
  });
}
