import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '/constants/style.dart';
import '/models/part.dart';

List<PieChartSectionData>? returnStockChartsData(Part part) => part.stock!.map((e) {
      return PieChartSectionData(
        color: returnColorForOperationNumber(e.operationNumber),
        value: e.stock.toDouble(),
        radius: 25,
        title: "OP${e.operationNumber}",
        showTitle: true,
        titleStyle: const TextStyle(
          fontSize: 14,
          color: light,
        ),
      );
    }).toList();

Color returnColorForOperationNumber(int _opNumber) {
  switch (_opNumber) {
    case 1:
      return op1Color;
    case 2:
      return op2Color;
    case 3:
      return op3Color;
    case 4:
      return op4Color;
    case 5:
      return op5Color;
    default:
      return opDefaultColor;
  }
}
