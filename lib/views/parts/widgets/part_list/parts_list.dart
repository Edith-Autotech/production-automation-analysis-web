import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/constants/controllers.dart';
import '/constants/style.dart';
import 'part_list_tile.dart';

class PartsList extends StatelessWidget {
  const PartsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 6),
            blurRadius: 12,
            color: lightGrey.withOpacity(.2),
        ),
        ],
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
