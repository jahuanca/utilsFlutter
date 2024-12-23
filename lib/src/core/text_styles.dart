
import 'package:flutter/material.dart';
import 'package:utils/src/data/data_functions.dart';

TextStyle primaryTextStyleBase(){
  return TextStyle(
    color: primaryTextColor(),
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );
}

TextStyle hintStyleBase() {
  return TextStyle(
      color: hintColor(),
      fontSize: 15,
      fontWeight: FontWeight.w400);
}

TextStyle hintLoginStyle() {
  return TextStyle(
      color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400);
}

TextStyle botonStyle({Color? textColor, required double fontSize}) {
  return TextStyle(color: textColor ?? cardColor(), fontSize: fontSize, fontWeight: FontWeight.bold);
}

TextStyle titleTextAppBarStyleBase(){
  return TextStyle(
    color: primaryTextColor(),
    fontSize: 16,
    fontWeight: FontWeight.w500
  );
}