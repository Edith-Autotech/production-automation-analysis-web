import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '/constants/style.dart';

class CustomPieChart extends StatelessWidget {
  final List<PieChartSectionData> chartData;
  final String centerText;
  const CustomPieChart({
    Key? key,
    required this.chartData,
    required this.centerText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          PieChart(
            PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 80,
              startDegreeOffset: -90,
              sections: chartData,
            ),
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                Text(
                  centerText,
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: dark.withOpacity(.8),
                        fontWeight: FontWeight.w600,
                        height: 0.5,
                      ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
