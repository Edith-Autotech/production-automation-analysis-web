import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final FontWeight weight;
  final TextOverflow? overflow;
  const CustomText(
    this.text, {
    Key? key,
    this.overflow,
    this.color = Colors.black,
    this.size = 16,
    this.weight = FontWeight.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      maxLines: 1,
      maxFontSize: size,
      minFontSize: 10,
      overflow: overflow ?? TextOverflow.ellipsis,
      wrapWords: true,
      style: TextStyle(
        color: color,
        fontWeight: weight,
      ),
    );
  }
}
