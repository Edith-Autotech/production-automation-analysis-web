import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../helper/stock_chart_list.dart';

import '/constants/style.dart';
import '/constants/controllers.dart';

import '../../../../widgets/charts/custom_pie_charts.dart';
import '/widgets/custom_text.dart';

import 'part_details.dart';

class SelectedPartSection extends StatelessWidget {
  const SelectedPartSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;

    return Obx(() {
      if (partController.selectedPart.value.partId == "") {
        return Container();
      }

      List<PieChartSectionData>? chartData = returnStockChartsData(
        partController.selectedPart.value,
      );

      if (chartData == null) {
        return const Center(
          child: CustomText(
            text: "Error Loading data",
          ),
        );
      }

      return Container(
        color: dark.withOpacity(.3),
        height: _height * 0.8,
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: CustomText(
                text: "Part Details",
                size: 24,
                weight: FontWeight.bold,
                color: dark,
              ),
            ),
            Expanded(child: Container()),
            CustomPieChart(centerText: "", chartData: chartData),
            Expanded(child: Container()),
            PartDetails(
              part: partController.selectedPart.value,
            ),
            Expanded(child: Container()),
          ],
        ),
      );
    });
  }
}
