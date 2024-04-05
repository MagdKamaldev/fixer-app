import 'package:fixer/core/constants/constants.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:flutter/material.dart';

class TextContainer extends StatelessWidget {
  final String text;
  final Color? color;
  final double margin;
  const TextContainer(
      {super.key, required this.text, this.color, required this.margin});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: margin),
      alignment: locale == "en" ? Alignment.topLeft : Alignment.topRight,
      child: Text(text, textAlign: TextAlign.start, style: TextStyles.bodybold),
    );
  }
}
