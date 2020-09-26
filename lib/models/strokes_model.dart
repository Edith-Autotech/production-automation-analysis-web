import 'package:charts_flutter/flutter.dart' as charts;
import 'package:cloud_firestore/cloud_firestore.dart';

class StrokesModel {
  final String xAxis;
  final int strokes;
  final charts.Color barColor;
  StrokesModel({
    this.barColor,
    this.xAxis,
    this.strokes,
  });

  StrokesModel fromDocumentSnapshot({DocumentSnapshot snapshot}) {
    return StrokesModel(barColor: null, xAxis: snapshot.id, strokes: snapshot.data()['count']);
  }
}
