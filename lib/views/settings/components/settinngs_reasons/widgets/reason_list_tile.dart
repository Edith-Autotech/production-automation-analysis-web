import 'package:flutter/material.dart';

import '/constants/style.dart';
import '/models/reason.dart';
import '/widgets/custom_text.dart';

class ReasonListTile extends StatelessWidget {
  final Reason reason;
  const ReasonListTile({Key? key, required this.reason}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: ListTile(
        title: CustomText(reason.reasonDescription),
        trailing: Container(
          height: 60,
          width: 60,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 1.5,
              color: dark.withOpacity(0.6),
            ),
          ),
          child: Center(
            child: CustomText(
              reason.reasonCode.toString(),
            ),
          ),
        ),
      ),
    );
  }
}
