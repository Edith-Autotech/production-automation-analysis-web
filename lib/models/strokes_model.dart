import 'package:charts_flutter/flutter.dart' as charts;
import 'package:cloud_firestore/cloud_firestore.dart';

class StrokesModel {
  final String hour;
  final int strokes;
  final charts.Color barColor;
  StrokesModel({
    this.barColor,
    this.hour,
    this.strokes,
  });

  StrokesModel fromDocumentSnapshot({DocumentSnapshot snapshot}) {
    return StrokesModel(barColor: null, hour: snapshot.documentID, strokes: snapshot.data['count']);
  }
}
