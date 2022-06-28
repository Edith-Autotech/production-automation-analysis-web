import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/widgets/custom_text.dart';

import '/constants/controllers.dart';
import '/widgets/charts/custom_bar_chart.dart';

class HourlyCountCharts extends StatelessWidget {
  const HourlyCountCharts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (countController.todaysCount.value == null) {
        return const Center(
          child: CustomText(
            "No Data for the selected date",
            weight: FontWeight.w700,
            size: 23,
          ),
        );
      } else {
        return CustomBarChart(
          count: countController.todaysCount.value!,
        );
      }
    });
  }
}
