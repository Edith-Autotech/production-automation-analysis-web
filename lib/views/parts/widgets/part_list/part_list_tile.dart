import 'package:flutter/material.dart';
import 'package:production_automation_web/routes/routes.dart';

import '/constants/controllers.dart';
import '/constants/style.dart';
import '/models/part.dart';
import '/widgets/custom_text.dart';

class PartListTile extends StatelessWidget {
  final Part part;
  const PartListTile({Key? key, required this.part}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        partController.changeSelectedPart(part);
        navigationController.navigateTo(partDetailsDisplayName);
      },
      child: Container(
        margin: const EdgeInsets.all(defaultPadding),
        padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding,
          vertical: defaultPadding / 2,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(defaultPadding / 2),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 6),
              blurRadius: 12,
              color: lightGrey.withOpacity(.2),
            ),
          ],
        ),
        child: Row(
          children: [
            CustomText(
              "#${part.partNumber}",
              color: dark,
              size: 18,
              weight: FontWeight.w400,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            CustomText(
              part.noOfOperations.toString(),
              color: dark.withOpacity(.6),
              size: 20,
              weight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
