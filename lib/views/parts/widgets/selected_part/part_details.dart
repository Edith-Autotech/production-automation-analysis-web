import 'package:flutter/material.dart';

import '/constants/controllers.dart';
import '/constants/style.dart';

import '/helper/responsive.dart';

import '/widgets/custom_text.dart';

import '/models/part.dart';
import 'stock_details.dart';

class PartDetails extends StatelessWidget {
  final Part part;
  const PartDetails({
    Key? key,
    required this.part,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: _height / 2,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: dark.withOpacity(.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!ResponsiveWidget.isSmallScreen(context))
            const SizedBox(
              height: 50,
            ),
          StockDetails(
            stock: partController.selectedPart.value!.stock!,
          ),
          if (!ResponsiveWidget.isSmallScreen(context))
            Expanded(
              child: Container(),
            ),
          _rowElement("Part id", part.partId),
          const SizedBox(height: defaultPadding),
          _rowElement("Part number", part.partNumber),
          const SizedBox(height: defaultPadding),
          _rowElement("Part name", part.partName),
          const SizedBox(height: defaultPadding),
          _rowElement("Company name", part.companyName),
          if (!ResponsiveWidget.isSmallScreen(context)) const SizedBox(height: defaultPadding),
        ],
      ),
    );
  }
}

Widget _rowElement(String title, String value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      CustomText(
        title,
        color: light.withOpacity(.8),
        size: 16,
      ),
      Expanded(child: Container()),
      Flexible(
        child: CustomText(
          value,
          color: light.withOpacity(.5),
          size: 18,
          weight: FontWeight.w500,
        ),
      )
    ],
  );
}
