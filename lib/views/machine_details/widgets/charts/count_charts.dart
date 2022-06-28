import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:production_automation_web/widgets/custom_text.dart';

import '/constants/controllers.dart';

import '/helper/count_chart_list.dart';

import '../../../../widgets/charts/custom_pie_charts.dart';

class CountChart extends StatelessWidget {
  const CountChart({Key? key}) : super(key: key);

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
        return CustomPieChart(
          centerText: countController.todaysCount.value!.count.toString(),
          chartData: returnCountChartsData(
            countController.todaysCount.value!,
          )!,
        );
      }
    });
  }
}
