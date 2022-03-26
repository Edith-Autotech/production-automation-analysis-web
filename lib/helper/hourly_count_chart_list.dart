import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '/constants/style.dart';

import '/models/count.dart';
import '/models/hourlly_count.dart';

BarChartGroupData makeGroupData(
  int index,
  HourlyCount hourlyCount, {
  Color barColor = Colors.white,
  double width = 22,
}) {
  return BarChartGroupData(
    x: index,
    barsSpace: 2.5,
    barRods: [
      BarChartRodData(
        y: hourlyCount.productionCount.toDouble(),
        colors: [production],
        width: width,
      ),
      BarChartRodData(
        y: hourlyCount.idleCount.toDouble(),
        colors: [idle],
        width: width,
      ),
      BarChartRodData(
        y: hourlyCount.standbyCount.toDouble(),
        colors: [standby],
        width: width,
      ),
    ],
  );
}

List<BarChartGroupData> showingGroups(Count count) => List.generate(
      count.hourlyCount!.length,
      (i) => makeGroupData(i, count.hourlyCount![i]),
    );

BarChartData mainBarData(Count count) {
  return BarChartData(
    titlesData: FlTitlesData(
      show: true,
      rightTitles: SideTitles(showTitles: false),
      topTitles: SideTitles(showTitles: false),
      leftTitles: SideTitles(showTitles: false),
      bottomTitles: SideTitles(
        showTitles: true,
        getTextStyles: (context, value) => TextStyle(
          color: dark,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
        margin: 12,
        getTitles: (double value) => count.hourlyCount![value.toInt()].timeRange,
      ),
    ),
    borderData: FlBorderData(show: false),
    barGroups: showingGroups(count),
    gridData: FlGridData(show: false),
    backgroundColor: lightGrey.withOpacity(.3),
  );
}
