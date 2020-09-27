import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String errorText;
  final bool enabled;
  final bool obscureText;
  final bool autoFocus;
  final Function onChanged;
  final Function onEditingComplete;
  final String hintText;
  final String labelText;
  final TextInputAction inputAction;
  final TextInputType inputType;
  CustomTextField({
    this.controller,
    this.focusNode,
    this.enabled,
    this.errorText,
    this.onChanged,
    this.onEditingComplete,
    this.labelText,
    this.autoFocus = false,
    this.obscureText = false,
    this.hintText,
    this.inputAction = TextInputAction.next,
    this.inputType = TextInputType.text,
  })  : assert(controller != null),
        assert(focusNode != null),
        assert(enabled != null),
        assert(onEditingComplete != null);
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.grey),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
        errorText: errorText,
      ),
      autocorrect: false,
      autofocus: autoFocus,
      enabled: enabled,
      keyboardType: inputType,
      textInputAction: inputAction,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      obscureText: obscureText,
    );
  }
}
