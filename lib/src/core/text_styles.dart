
import 'package:flutter/material.dart';
import 'package:utils/src/data/data_functions.dart';

TextStyle primaryHintStyle() {
  return TextStyle(
      color: primaryTextColor(),
      fontSize: 14,
      fontWeight: FontWeight.w300);
}

TextStyle hintLoginStyle() {
  return TextStyle(
      color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400);
}

TextStyle botonStyle() {
  return TextStyle(color: cardColor(), fontSize: 20, fontWeight: FontWeight.bold);
}

TextStyle titleTextAppBarStyleBase(){
  return TextStyle(
    color: primaryTextColor(),
    fontSize: 16,
    fontWeight: FontWeight.w500
  );
}