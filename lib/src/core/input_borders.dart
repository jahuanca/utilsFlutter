import 'package:flutter/material.dart';
import 'package:utils/src/core/dimens.dart';
import 'package:utils/src/data/data.dart';

InputBorder inputBorder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(width: 1, color: primaryColor()));
}

InputBorder inputBorderError() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(width: 1, color: dangerColor()));
}