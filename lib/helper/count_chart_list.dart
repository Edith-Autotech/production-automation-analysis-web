import 'package:fl_chart/fl_chart.dart';

import '/constants/style.dart';

import '/models/count.dart';

List<PieChartSectionData>? returnCountChartsData(Count count) {
  return [
    PieChartSectionData(
      color: standbyColor,
      title: "Standby",
      value: count.standbyCount.toDouble(),
      showTitle: false,
      radius: 25,
    ),
    PieChartSectionData(
      color: idleColor,
      title: "Idle",
      value: count.idleCount.toDouble(),
      showTitle: false,
      radius: 25,
    ),
    PieChartSectionData(
      color: productionColor,
      title: "Production",
      value: count.productionCount.toDouble(),
      showTitle: false,
      radius: 25,
    ),
  ];
}

double calculateTotalCount(Count count) {
  double totalCount = 0;

  totalCount += count.productionCount.toDouble();
  totalCount += count.idleCount.toDouble();
  totalCount += count.standbyCount.toDouble();

  return totalCount;
}
