import 'package:flutter/material.dart';

import '/constants/controllers.dart';
import '/constants/style.dart';
import '/models/part.dart';
import '/widgets/custom_text.dart';

class PartListTile extends StatelessWidget {
  final Part part;
  const PartListTile({Key? key, required this.part}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: CustomText(
        text: part.partNumber.toString(),
        color: dark,
        size: 18,
        weight: FontWeight.w400,
      ),
      trailing: CustomText(
        text: part.noOfOperations.toString(),
        color: dark.withOpacity(.6),
        size: 20,
        weight: FontWeight.bold,
      ),
      onTap: () => partController.changeSelectedPart(part),
      selected: partController.selectedPart.value == part,
      selectedColor: lightGrey,
    );
  }
}
