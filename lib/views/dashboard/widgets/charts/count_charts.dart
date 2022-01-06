import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/constants/controllers.dart';

import '/helper/count_chart_list.dart';

import '../../../../widgets/charts/custom_pie_charts.dart';

class CountChart extends StatelessWidget {
  const CountChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomPieChart(
        centerText: countController.todaysCount.value.count.toString(),
        chartData: returnCountChartsData(
          countController.todaysCount.value,
        )!,
      ),
    );
  }
}
