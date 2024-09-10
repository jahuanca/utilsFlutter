import 'package:flutter/material.dart';
import 'package:utils/src/core/colors.dart';
import 'package:utils/src/core/dimens.dart';

class DataConfig {
  Color primaryColor;
  Color secondaryColor;
  Color cardColor;
  Color infoColor;
  Color primaryTextColor;

  double borderRadius;
  double dimensionInput;
  

  DataConfig({
    this.primaryColor =  primaryColorBase,
    this.secondaryColor = secondColorBase,
    this.cardColor = cardColorBase,
    this.infoColor = infoColorBase,
    this.primaryTextColor = primaryTextColorBase,
    this.borderRadius = borderRadiusBase,
    this.dimensionInput = dimensionInputBase
  });

  factory DataConfig.fromJson(Map<String, dynamic> json) => DataConfig(
        primaryColor: json["primaryColor"],
        secondaryColor: json["secondaryColor"],
        cardColor: json["cardColor"],
        infoColor: json["infoColor"],
        primaryTextColor: json["primaryTextColor"],

        borderRadius: json["borderRadius"],
        dimensionInput: json["dimensionInput"],
      );

  Map<String, dynamic> toJson() => {
        "primaryColor": primaryColor,
        "secondaryColor": secondaryColor,
        "cardColor": cardColor,
        "infoColor": infoColor,
        "primaryTextColor": primaryTextColor,

        "dimensionInput": dimensionInput,
        "borderRadius": borderRadius,
      };
}
