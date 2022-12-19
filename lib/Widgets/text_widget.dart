import 'package:flutter/material.dart';

Text textInfo(
  String text,
  FontWeight fontWeight,
  Color? color,
  double fontsize,
  String fontFamily,
) {
  return Text(
    text,
    style: TextStyle(
      fontWeight: fontWeight,
      color: color,
      fontSize: fontsize,
      fontFamily: fontFamily,
    ),
  );
}
