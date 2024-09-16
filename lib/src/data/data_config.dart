import 'package:flutter/material.dart';
import 'package:utils/src/core/colors.dart';
import 'package:utils/src/core/dimens.dart';
import 'package:utils/src/core/input_borders.dart';
import 'package:utils/src/core/text_styles.dart';

class DataConfig {
  Color primaryColor;
  Color secondaryColor;
  Color cardColor;
  Color primaryTextColor;
  Color hintColor;
  Color backgroundPageColor;

  Color infoColor;
  Color dangerColor;
  Color successColor;

  double borderRadius;
  double dimensionInput;

  TextStyle? titleTextAppBarStyle;
  TextStyle? hintStyle;
  InputBorder? inputBorder;
  

  DataConfig({
    this.primaryColor =  primaryColorBase,
    this.secondaryColor = secondColorBase,
    this.cardColor = cardColorBase,
    this.infoColor = infoColorBase,
    this.successColor = successColorBase,
    this.dangerColor = dangerColorBase,
    this.primaryTextColor = primaryTextColorBase,
    this.hintColor = hintColorBase,
    this.backgroundPageColor = backgroundPageColorBase,

    this.borderRadius = borderRadiusBase,
    this.dimensionInput = dimensionInputBase,

    this.titleTextAppBarStyle,
    this.inputBorder,
    this.hintStyle,
  }){

    titleTextAppBarStyle ??= titleTextAppBarStyleBase();
    inputBorder ??= inputBorderBase();
    hintStyle ??= hintStyleBase();

  }

  factory DataConfig.fromJson(Map<String, dynamic> json) => DataConfig(
        primaryColor: json["primaryColor"],
        secondaryColor: json["secondaryColor"],
        cardColor: json["cardColor"],
        infoColor: json["infoColor"],
        dangerColor: json["dangerColor"],
        primaryTextColor: json["primaryTextColor"],
        backgroundPageColor: json["backgroundPageColor"],

        borderRadius: json["borderRadius"],
        dimensionInput: json["dimensionInput"],

        titleTextAppBarStyle: json["titleTextAppBarStyle"],
        hintStyle: json["hintStyle"],
        inputBorder: json["inputBorder"],
      );

  Map<String, dynamic> toJson() => {
        "primaryColor": primaryColor,
        "secondaryColor": secondaryColor,
        "cardColor": cardColor,
        "dangerColor": dangerColor,
        "infoColor": infoColor,
        "successColor": successColor,
        "primaryTextColor": primaryTextColor,
        "backgroundPageColor": backgroundPageColor,

        "dimensionInput": dimensionInput,
        "borderRadius": borderRadius,

        "titleTextAppBarStyle": titleTextAppBarStyle,
        "hintStyle": hintStyle,
        "inputBorder": inputBorder,
      };
}
