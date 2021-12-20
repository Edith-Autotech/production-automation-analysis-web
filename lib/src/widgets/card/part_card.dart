import 'package:flutter/material.dart';
import 'package:production_automation_web/src/models/factory.dart';
import 'package:production_automation_web/src/models/part.dart';
import 'package:production_automation_web/src/widgets/label/label.dart';

class PartCard extends StatelessWidget {
  final Part part;
  final FactoryModel factoryModel;
  final Function handler;
  const PartCard({
    Key? key,
    required this.part,
    required this.factoryModel,
    required this.handler,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: TextButton(
        onPressed: () => handler(),
        child: SizedBox(
          height: 50,
          child: Center(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: label(part.partNumber),
                ),
                Expanded(child: Container()),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: label(part.noOfOperations.toString()),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
