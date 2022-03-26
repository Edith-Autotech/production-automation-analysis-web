import 'package:flutter/material.dart';

import '/constants/style.dart';

import '/widgets/custom_text.dart';

class StockDetailsBox extends StatelessWidget {
  final String operationString;
  final int count;
  const StockDetailsBox({
    Key? key,
    required this.operationString,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1.5,
          color: light.withOpacity(0.6),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: CustomText(
              text: operationString,
              color: light.withOpacity(0.7),
              weight: FontWeight.w500,
            ),
          ),
          Flexible(
            child: CustomText(
              text: count.toString(),
              size: 20,
              color: light.withOpacity(0.8),
              weight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
