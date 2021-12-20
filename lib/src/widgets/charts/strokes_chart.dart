// import 'package:flutter/material.dart';
// import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:production_automation_web/src/widgets/loadingSpinner/loading_spinner.dart';

// import '/constants.dart';
// import '/src/models/count_model.dart';
// import '/src/models/machine.dart';
// import '/src/models/strokes_model.dart';

// // ignore: must_be_immutable
// class StrokesChart extends StatefulWidget {
//   final CountModel countModel;
//   final Machine machine;

//   StrokesChart({
//     required this.countModel,
//     required this.machine,
//   });
//   late List<StrokesModel>? productionData = [];
//   late List<StrokesModel>? idleData = [];
//   late List<StrokesModel>? standbyData = [];
//   @override
//   _StrokesChartState createState() => _StrokesChartState();
// }

// class _StrokesChartState extends State<StrokesChart> {
//   late List<charts.Series<StrokesModel, String>>? seriesList;

//   List<StrokesModel> data = [];
//   List<StrokesModel> filteredData = [];
//   bool _isLoading = false;

//   @override
//   void initState() {
//     super.initState();
//     _fetchData();
//   }

//   Future<void> _fetchData() async {
//     _isLoading = true;
//     if (mounted) setState(() {});
//     // * extracting data from hourlyCounts and sorting them into respective arrays
//     widget.countModel.hourlyCount!.map((hourlyCount) {
//       widget.productionData!.add(
//         StrokesModel(
//           timeRange: hourlyCount.timeRange,
//           strokes: hourlyCount.productionCount,
//         ),
//       );
//       widget.idleData!.add(
//         StrokesModel(
//           timeRange: hourlyCount.timeRange,
//           strokes: hourlyCount.idleCount,
//         ),
//       );
//       widget.standbyData!.add(
//         StrokesModel(
//           timeRange: hourlyCount.timeRange,
//           strokes: hourlyCount.standbyCount,
//         ),
//       );
//       if (mounted) setState(() {});
//     }).toList();

//     if (mounted) {
//       setState(() {
//         seriesList = [
//           // !Solid red bars for standby count
//           charts.Series<StrokesModel, String>(
//             id: Constants.standby,
//             domainFn: (StrokesModel sModel, _) => sModel.timeRange,
//             measureFn: (StrokesModel sModel, _) => sModel.strokes,
//             data: widget.standbyData!,
//             colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
//           ),
//           // *Hollow green bars for idle count.
//           charts.Series<StrokesModel, String>(
//             id: Constants.idle,
//             domainFn: (StrokesModel sModel, _) => sModel.timeRange,
//             measureFn: (StrokesModel sModel, _) => sModel.strokes,
//             data: widget.idleData!,
//             colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
//             fillColorFn: (_, __) => charts.MaterialPalette.transparent,
//           ),
//           // ?Blue bars with a lighter center color for production count.
//           charts.Series<StrokesModel, String>(
//             id: Constants.production,
//             domainFn: (StrokesModel sModel, _) => sModel.timeRange,
//             measureFn: (StrokesModel sModel, _) => sModel.strokes,
//             data: widget.productionData!,
//             colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
//             fillColorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault.lighter,
//           ),
//         ];
//       });
//     }
//     _isLoading = false;
//     if (mounted) setState(() {});
//   }

//   List<StrokesModel> fetchCorrectedList(List<StrokesModel> localList) {
//     List<StrokesModel> localFilteredList = [];
//     localList.forEach((element) {
//       var i = localList.indexOf(element);
//       if (i == 0) {
//         setState(() {
//           localFilteredList.add(
//             StrokesModel(
//               strokes: element.strokes,
//               timeRange: element.timeRange,
//             ),
//           );
//         });
//       } else {
//         setState(() {
//           localFilteredList
//               .add(StrokesModel(strokes: element.strokes - localList[i - 1].strokes, timeRange: element.timeRange));
//         });
//       }
//     });
//     return localFilteredList;
//   }

//   @override
//   Widget build(BuildContext context) {
//     int fixedPixel = 25;
//     List<charts.Series<StrokesModel, String>> series = [
//       charts.Series(
//         id: "Strokes",
//         data: filteredData,
//         domainFn: (StrokesModel model, _) => model.timeRange.toString(),
//         measureFn: (StrokesModel model, _) => model.strokes,
//       )
//     ];
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       reverse: true,
//       child: Container(
//         constraints: BoxConstraints(
//           maxWidth: 1.5 * 100 * (seriesList != null ? seriesList!.length : 10),
//           maxHeight: 200,
//         ),
//         child: !_isLoading
//             ? charts.BarChart(
//                 seriesList != null ? seriesList! : series,
//                 animate: true,
//                 animationDuration: const Duration(milliseconds: 400),
//                 layoutConfig: charts.LayoutConfig(
//                   topMarginSpec: charts.MarginSpec.fixedPixel(fixedPixel),
//                   rightMarginSpec: charts.MarginSpec.fixedPixel(fixedPixel),
//                   bottomMarginSpec: charts.MarginSpec.fixedPixel(fixedPixel),
//                   leftMarginSpec: charts.MarginSpec.fixedPixel(fixedPixel),
//                 ),
//                 behaviors: [
//                   charts.SlidingViewport(charts.SelectionModelType.action),
//                   charts.PanBehavior(),
//                   charts.PanAndZoomBehavior()
//                 ],
//                 // selectionModels: [
//                 //   charts.SelectionModelConfig(changedListener: (charts.SelectionModel model) {
//                 //     print(model.selectedSeries[0].data);
//                 //     if (model.hasDatumSelection)
//                 //       print("-------------" +
//                 //           model.selectedSeries[0].measureFn(model.selectedDatum[0].index).toString() +
//                 //           "-------------");
//                 //   })
//                 // ],
//                 defaultRenderer: charts.BarRendererConfig(
//                   groupingType: charts.BarGroupingType.stacked,
//                   strokeWidthPx: 2.0,
//                 ),
//               )
//             : loadingSpinner(context),
//       ),
//     );
//   }
// }
