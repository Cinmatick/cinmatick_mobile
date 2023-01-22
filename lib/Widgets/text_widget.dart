import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Text textInfo(
  String text,
  FontWeight fontWeight,
  Color? color,
  double fontsize,
  String fontFamily,
) {
  return Text(
    text,
    style: GoogleFonts.nunito(
      fontWeight: fontWeight,
      color: color,
      fontSize: fontsize,
      // fontFamily: ,
    ),
  );
}

TextStyle textStyle(
  FontWeight fontWeight,
  Color? color,
  double fontsize,
  // String fontFamily,
){
  return TextStyle(
    fontWeight: fontWeight,
      color: color,
      fontSize: fontsize,
      // fontFamily: 
  );
}

TextStyle textStyle1(
  FontWeight fontWeight,
  Color? color,
  double fontsize,
  // String fontFamily,
){
  return GoogleFonts.nunito(
      fontWeight: fontWeight,
      color: color,
      fontSize: fontsize,
      // fontFamily: ,
    );
}
