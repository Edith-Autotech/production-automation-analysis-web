import 'package:flutter/material.dart';
import 'package:production_automation_web/helper/logger.dart';
import 'package:production_automation_web/models/hourlly_count.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '/constants/style.dart';
import '/models/count.dart';

class CustomBarChart extends StatefulWidget {
  final Count count;

  const CustomBarChart({Key? key, required this.count}) : super(key: key);

  @override
  State<CustomBarChart> createState() => _CustomBarChartState();
}

class _CustomBarChartState extends State<CustomBarChart> {
  List<HourlyCount> allDayCounts = [];
  late TooltipBehavior _tooltipBehavior;
  late MarkerSettings _markerSettings;
  void listOperations() {
    for (var i = 0; i < 24; i++) {
      HourlyCount indexedHourlyCount;
      try {
        indexedHourlyCount = widget.count.hourlyCount!.where((element) {
          return int.parse(element.timeRange.split("-").first) == i;
        }).first;
      } catch (error) {
        indexedHourlyCount = HourlyCount(
          timeRange: "${i < 10 ? 0 : ""}$i - ${i + 1}",
          productionCount: 0,
          idleCount: 0,
          standbyCount: 0,
        );
      }
      logger.i(indexedHourlyCount);
      allDayCounts.add(
        HourlyCount(
          timeRange: indexedHourlyCount.timeRange,
          productionCount: indexedHourlyCount.productionCount,
          idleCount: indexedHourlyCount.idleCount,
          standbyCount: indexedHourlyCount.standbyCount,
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    listOperations();
    _tooltipBehavior = TooltipBehavior(enable: true);
    _markerSettings = const MarkerSettings(isVisible: false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(defaultPadding),
      child: Column(
        children: [
          SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            title: ChartTitle(text: "Hourly Count"),
            tooltipBehavior: _tooltipBehavior,
            series: <ChartSeries>[
              StackedColumnSeries<HourlyCount, String>(
                dataSource: allDayCounts.sublist(0, 12),
                xValueMapper: (HourlyCount data, _) => data.timeRange.split("-").first,
                yValueMapper: (HourlyCount data, _) => data.productionCount,
                color: productionColor,
                name: "Production",
                markerSettings: _markerSettings,
              ),
              StackedColumnSeries<HourlyCount, String>(
                dataSource: allDayCounts.sublist(0, 12),
                xValueMapper: (HourlyCount data, _) => data.timeRange.split("-").first,
                yValueMapper: (HourlyCount data, _) => data.idleCount,
                color: idleColor,
                name: "Idle",
                markerSettings: _markerSettings,
              ),
              StackedColumnSeries<HourlyCount, String>(
                dataSource: allDayCounts.sublist(0, 12),
                xValueMapper: (HourlyCount data, _) => data.timeRange.split("-").first,
                yValueMapper: (HourlyCount data, _) => data.standbyCount,
                color: standbyColor,
                name: "Standby",
                markerSettings: _markerSettings,
              ),
            ],
          ),
          SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            tooltipBehavior: _tooltipBehavior,
            legend: Legend(
              isVisible: true,
              isResponsive: true,
              position: LegendPosition.top,
              alignment: ChartAlignment.center,
            ),
            series: <ChartSeries>[
              StackedColumnSeries<HourlyCount, String>(
                dataSource: allDayCounts.sublist(12, 24),
                xValueMapper: (HourlyCount data, _) => data.timeRange.split("-").first,
                yValueMapper: (HourlyCount data, _) => data.productionCount,
                color: productionColor,
                name: "Production",
                markerSettings: _markerSettings,
              ),
              StackedColumnSeries<HourlyCount, String>(
                dataSource: allDayCounts.sublist(12, 24),
                xValueMapper: (HourlyCount data, _) => data.timeRange.split("-").first,
                yValueMapper: (HourlyCount data, _) => data.idleCount,
                color: idleColor,
                name: "Idle",
                markerSettings: _markerSettings,
              ),
              StackedColumnSeries<HourlyCount, String>(
                dataSource: allDayCounts.sublist(12, 24),
                xValueMapper: (HourlyCount data, _) => data.timeRange.split("-").first,
                yValueMapper: (HourlyCount data, _) => data.standbyCount,
                color: standbyColor,
                name: "Standby",
                markerSettings: _markerSettings,
              ),
            ],
          ),
        ],
      ),

      // BarChart(mainBarData(count)),
    );
  }
}
