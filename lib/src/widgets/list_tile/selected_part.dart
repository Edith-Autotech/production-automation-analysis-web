import 'package:flutter/material.dart';
import 'package:production_automation_web/src/models/part.dart';
import 'package:production_automation_web/src/widgets/label/label.dart';

class SelectedPartWidget extends StatelessWidget {
  const SelectedPartWidget(this.selectedPart, this.currentlyWorking, {Key? key}) : super(key: key);

  final Part selectedPart;
  final VoidCallback currentlyWorking;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.symmetric(
        vertical: 2,
        horizontal: 4,
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 8,
                bottom: 8,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  label("Part Number"),
                  label(selectedPart.partNumber),
                  label("Part Name"),
                  label(selectedPart.partName),
                  label("No of operations"),
                  label(selectedPart.noOfOperations.toString())
                ],
              ),
            ),
          ),
          TextButton(
            child: label("Currently Working"),
            onPressed: currentlyWorking,
          ),
        ],
      ),
    );
  }
}
