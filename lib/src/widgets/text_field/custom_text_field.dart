import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final Widget? sufixIcon;
  final FocusNode focusNode;
  final bool? readOnly;
  final String? errorText;
  final bool enabled;
  final bool? obscureText;
  final bool? autoFocus;
  final Function(String)? onChanged;
  final VoidCallback onEditingComplete;
  final String? hintText;
  final String? labelText;
  final TextInputAction? inputAction;
  final TextInputType? inputType;
  final bool whiteTextColor;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.focusNode,
    this.enabled = true,
    this.errorText,
    this.onChanged,
    required this.onEditingComplete,
    this.labelText,
    this.autoFocus = false,
    this.obscureText = false,
    this.readOnly = false,
    this.hintText,
    this.inputAction = TextInputAction.next,
    this.inputType = TextInputType.text,
    this.sufixIcon,
    this.whiteTextColor = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
          color: whiteTextColor ? Colors.white : Colors.black, fontSize: 19,),
      controller: controller,
      focusNode: focusNode,
      decoration: InputDecoration(
        labelStyle: TextStyle(
          color: whiteTextColor ? Colors.white : Colors.black,
          fontSize: 17,
          fontStyle: FontStyle.italic,
        ),
        suffixIcon: sufixIcon,
        labelText: labelText,
        hintText: hintText,
        hintStyle: TextStyle(
          color: whiteTextColor ? Colors.white : Colors.grey,
          fontSize: 16,
        ),
        focusColor: whiteTextColor ? Colors.white : Colors.black,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: whiteTextColor ? Colors.white : Colors.black,
          ),
          borderRadius: BorderRadius.circular(7),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
        errorText: errorText,
      ),
      readOnly: readOnly!,
      autocorrect: false,
      autofocus: autoFocus!,
      enabled: enabled,
      keyboardType: inputType,
      textInputAction: inputAction,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      obscureText: obscureText!,
    );
  }
}
