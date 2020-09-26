import 'package:flutter/material.dart';
import '../../models/part.dart';

class PartTile extends StatelessWidget {
  final Part part;
  PartTile({this.part});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ListTile(
        title: Text(part.partNumber.toString()),
        subtitle: Text(part.partName.toString()),
      ),
    );
  }
}
