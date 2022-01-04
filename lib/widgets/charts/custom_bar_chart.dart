import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '/helper/hourly_count_chart_list.dart';
import '/models/count.dart';

class CustomBarChart extends StatelessWidget {
  final Count count;

  const CustomBarChart({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BarChart(mainBarData(count)),
      ),
    );
  }
}
