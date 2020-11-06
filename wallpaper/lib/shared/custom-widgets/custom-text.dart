import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String text;
  int maxLines;
  double fontSize;
  double minFontSize;
  double maxFontSize;
  double letterSpacing;
  double wordSpacing;
  TextOverflow textOverFlow;
  Color color;
  TextAlign textAlign;
  FontWeight fontWeight;
  CustomText({
    this.text,
    this.maxLines,
    this.fontSize,
    this.minFontSize,
    this.maxFontSize,
    this.textOverFlow,
    this.color,
    this.textAlign,
    this.fontWeight,
    this.letterSpacing,
    this.wordSpacing
  });
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      '${text??''}',
      style: TextStyle(
        fontSize: fontSize??16,
        color: color??Colors.black,
        fontWeight: fontWeight??FontWeight.normal,
        letterSpacing: letterSpacing??1.2,
        wordSpacing: wordSpacing??5
      ),
      textAlign: textAlign??TextAlign.center,
      maxLines: maxLines??1,
      maxFontSize: maxFontSize??30,
      minFontSize: minFontSize??11,
      overflow: textOverFlow??TextOverflow.ellipsis
    );
  }
}