import 'package:flutter/material.dart';


import '/constants/style.dart';
import '/constants/controllers.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: TextField(
        onChanged: (value) {
          partController.updateSearchString(value);
        },
        decoration: InputDecoration(
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
