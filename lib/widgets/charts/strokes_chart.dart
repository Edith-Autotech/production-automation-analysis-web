import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../../models/strokes_model.dart';

class StrokesChart extends StatelessWidget {
  final List<StrokesModel> data;

  const StrokesChart({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    List<charts.Series<StrokesModel, String>> series = [
      charts.Series(
        id: "Strokes",
        data: data,
        domainFn: (StrokesModel model, _) => model.xAxis.toString(),
        measureFn: (StrokesModel model, _) => model.strokes,
        // colorFn: (StrokesModel model, _) => model.barColor,
      )
    ];
    return charts.BarChart(
      series,
      animate: true,
    );
  }
}
