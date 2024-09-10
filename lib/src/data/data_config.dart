import 'package:flutter/material.dart';
import 'package:utils/src/core/colors.dart';
import 'package:utils/src/core/dimens.dart';
import 'package:utils/src/core/text_styles.dart';

class DataConfig {
  Color primaryColor;
  Color secondaryColor;
  Color cardColor;
  Color infoColor;
  Color primaryTextColor;
  Color backgroundPageColor;

  double borderRadius;
  double dimensionInput;

  TextStyle? titleTextAppBarStyle;
  

  DataConfig({
    this.primaryColor =  primaryColorBase,
    this.secondaryColor = secondColorBase,
    this.cardColor = cardColorBase,
    this.infoColor = infoColorBase,
    this.primaryTextColor = primaryTextColorBase,
    this.backgroundPageColor = backgroundPageColorBase,

    this.borderRadius = borderRadiusBase,
    this.dimensionInput = dimensionInputBase,

    this.titleTextAppBarStyle
  }){

    titleTextAppBarStyle ??= titleTextAppBarStyleBase();

  }

  factory DataConfig.fromJson(Map<String, dynamic> json) => DataConfig(
        primaryColor: json["primaryColor"],
        secondaryColor: json["secondaryColor"],
        cardColor: json["cardColor"],
        infoColor: json["infoColor"],
        primaryTextColor: json["primaryTextColor"],
        backgroundPageColor: json["backgroundPageColor"],

        borderRadius: json["borderRadius"],
        dimensionInput: json["dimensionInput"],

        titleTextAppBarStyle: json["titleTextAppBarStyle"],
      );

  Map<String, dynamic> toJson() => {
        "primaryColor": primaryColor,
        "secondaryColor": secondaryColor,
        "cardColor": cardColor,
        "infoColor": infoColor,
        "primaryTextColor": primaryTextColor,
        "backgroundPageColor": backgroundPageColor,

        "dimensionInput": dimensionInput,
        "borderRadius": borderRadius,

        "titleTextAppBarStyle": titleTextAppBarStyle,
      };
}
