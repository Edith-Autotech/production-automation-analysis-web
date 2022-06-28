import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:production_automation_web/constants/style.dart';

import '/constants/controllers.dart';
import 'part_list_tile.dart';

class PartsList extends StatelessWidget {
  const PartsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: BoxDecoration(
        color: canvasColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Obx(
        () => ListView(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          children: partController.partsList.map((element) {
            if (element.partNumber.toLowerCase().contains(
                  partController.searchPartNumberString,
                )) {
              return PartListTile(part: element);
            } else {
              return Container();
            }
          }).toList(),
        ),
      ),
    );
  }
}
