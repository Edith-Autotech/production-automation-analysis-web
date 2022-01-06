import 'package:flutter/material.dart';

import '/helper/responsive.dart';

import '/widgets/grid_view.dart';

import '/models/stock.dart';

import 'stock_details_box.dart';

class StockDetails extends StatelessWidget {
  final List<Stock> stock;
  const StockDetails({
    Key? key,
    required this.stock,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    if (ResponsiveWidget.isLargeScreen(context) || ResponsiveWidget.isMediumScreen(context)) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: stock.map((e) {
          return StockDetailsBox(
            operationString: "OP-${e.operationNumber}",
            count: e.stock,
          );
        }).toList(),
      );
    } else {
      return CustomGridView(
        crossAxisCount: _width < 650 ? 2 : 3,
        childAspectRatio: _width < 650 ? 1.3 : 1,
        data: stock,
        childItem: (p0) => StockDetailsBox(
          operationString: "OP-${p0.operationNumber}",
          count: p0.stock,
        ),
      );
    }
  }
}
