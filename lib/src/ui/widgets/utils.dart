import 'package:flutter/material.dart';
import 'package:utils/src/core/dimens.dart';
import 'package:utils/src/core/input_borders.dart';
import 'package:utils/utils.dart';

Widget labelWidget({
  required Size size,
  required String? label,
  required TextStyle? textStyleLabel,
  double heigthPadding = defaultDouble,
}) =>
    (label == null)
        ? emptyWidget
        : Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: heigthPadding),
            height: size.height * dimensionInput() * 0.6,
            child: Text(
              label.orEmpty(),
              style: textStyleLabel ?? labelStyle(),
            ),
          );

Widget errorContainerWidget({
  required String? error,
}) =>
    Container(
      alignment: Alignment.centerLeft,
      child: Text(
        error.orEmpty(),
        style: TextStyle(color: dangerColor()),
      ),
    );

BoxDecoration boxDecorationWidget({
  required String? error,
  required Color? backgroundColor,
}) =>
    BoxDecoration(
        color: backgroundColor ?? cardColor(),
        border:
            Border.all(color: error == null ? primaryColor() : dangerColor()),
        borderRadius: BorderRadius.circular(borderRadius()));

InputDecoration inputDecorationWidget({
  required String? error,
  required InputBorder? inputBorderSelected,
  required double heigthPadding,
  bool isDense = false,
  String? hintText,
  Widget? prefixIcon,
  bool isTextArea = false,
  Color? backgroundColor,
}) =>
    InputDecoration(
      isDense: isDense,
      prefixIcon: prefixIcon,
      border: error == null ? inputBorderSelected : inputBorderError(),
      enabledBorder: error == null ? inputBorderSelected : inputBorderError(),
      disabledBorder: error == null ? inputBorderSelected : inputBorderError(),
      focusedBorder: error == null ? inputBorderSelected : inputBorderError(),
      filled: true,
      fillColor: backgroundColor ?? cardColor(),
      contentPadding: isTextArea
          ? contentPaddingTextArea
          : EdgeInsets.symmetric(vertical: heigthPadding, horizontal: 25),
      counterText: emptyString,
      counterStyle: TextStyle(fontSize: defaultDouble),
      hintText: hintText,
      hintStyle: hintStyle(),
    );

double heightWidget({
  required Size size,
}) =>
    size.height * dimensionInput() * 0.59;