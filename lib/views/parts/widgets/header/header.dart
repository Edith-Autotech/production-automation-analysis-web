import 'package:flutter/material.dart';

import '/constants/controllers.dart';
import '/constants/style.dart';

class PartsHeader extends StatelessWidget {
  const PartsHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: TextField(
        onChanged: (value) {
          partController.updateSearchString(value);
        },
        decoration: const InputDecoration(
          labelText: 'Search by part number',
          labelStyle: TextStyle(color: active),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: active),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: active),
          ),
          suffixIcon: Icon(
            Icons.search,
            color: active,
          ),
        ),
      ),
    );
  }
}
