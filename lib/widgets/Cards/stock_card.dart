import 'package:flutter/material.dart';
import 'package:production_automation_web/models/stock.dart';

class StockCard extends StatelessWidget {
  final Stock stock;
  StockCard({this.stock});

  Widget _rowItem({List<Widget> children}) => Row(children: children);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 30,
          width: 0.15 * MediaQuery.of(context).size.width,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _rowItem(children: [Text(stock.operationNo)]),
                _rowItem(children: [
                  Text("Stock"),
                  Expanded(child: Container()),
                  Text(stock.stock)
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
