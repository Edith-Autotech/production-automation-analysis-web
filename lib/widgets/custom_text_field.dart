// ? Custom TextField

// ? system imports
import 'package:flutter/material.dart';
import 'package:production_automation_web/constants/style.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String? errorText;
  final bool enabled;
  final bool obscureText;
  final bool autoFocus;
  final Function(String)? onChanged;
  final Function? onEditingComplete;
  final String? hintText;
  final String? labelText;
  final TextInputAction inputAction;
  final TextInputType inputType;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.focusNode,
    this.errorText,
    this.enabled = true,
    this.obscureText = false,
    this.autoFocus = false,
    this.onChanged,
    this.onEditingComplete,
    this.hintText,
    this.labelText,
    this.inputAction = TextInputAction.next,
    this.inputType = TextInputType.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: dark,
      ),
      child: TextField(
        style: TextStyle(color: dark),
        controller: controller,
        focusNode: focusNode,
        decoration: InputDecoration(
          labelStyle: TextStyle(
            fontSize: 17,
            color: dark,
          ),
          labelText: labelText,
          hintText: hintText,
          hintStyle: TextStyle(color: lightGrey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(defaultPadding),
            borderSide: BorderSide(color: lightGrey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(defaultPadding),
            borderSide: BorderSide(color: lightGrey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(defaultPadding),
            borderSide: BorderSide(color: active),
          ),
          focusColor: lightGrey,
          errorText: errorText,
        ),
        cursorColor: dark,
        autocorrect: false,
        autofocus: autoFocus,
        enabled: enabled,
        keyboardType: inputType,
        textInputAction: inputAction,
        onChanged: onChanged,
        onEditingComplete: onEditingComplete as void Function()?,
        obscureText: obscureText,
      ),
    );
  }
}
