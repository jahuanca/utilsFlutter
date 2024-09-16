
import 'package:flutter/material.dart';
import 'package:utils/src/data/data_functions.dart';

TextStyle primaryTextStyleBase(){
  return TextStyle(
    color: primaryTextColor(),
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );
}

TextStyle primaryHintStyleBase() {
  return TextStyle(
      color: hintColor(),
      fontSize: 15,
      fontWeight: FontWeight.w400);
}

TextStyle hintLoginStyle() {
  return TextStyle(
      color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400);
}

TextStyle botonStyle({Color? textColor}) {
  return TextStyle(color: textColor ?? cardColor(), fontSize: 20, fontWeight: FontWeight.bold);
}

TextStyle titleTextAppBarStyleBase(){
  return TextStyle(
    color: primaryTextColor(),
    fontSize: 16,
    fontWeight: FontWeight.w500
  );
}