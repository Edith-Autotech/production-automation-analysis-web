import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/constants/controllers.dart';
import '/widgets/charts/custom_bar_chart.dart';

class HourlyCountCharts extends StatelessWidget {
  const HourlyCountCharts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomBarChart(
        count: countController.todaysCount.value,
      ),
    );
  }
}
