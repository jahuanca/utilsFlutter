import 'package:flutter/material.dart';
import 'package:utils/src/data/data_functions.dart';

InputBorder inputBorderBase() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius()),
      borderSide: BorderSide(width: 1, color: primaryColor()));
}

InputBorder inputBorderError() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius()),
      borderSide: BorderSide(width: 1, color: dangerColor()));
}