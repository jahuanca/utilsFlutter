import 'package:flutter/material.dart';
import 'package:utils/src/core/colors.dart';

class ColorsData {
  Color primaryColor;
  Color secondaryColor;
  Color cardColor;
  Color infoColor;
  Color primaryTextColor;

  ColorsData({
    this.primaryColor =  primaryColorBase,
    this.secondaryColor = secondColorBase,
    this.cardColor = cardColorBase,
    this.infoColor = infoColorBase,
    this.primaryTextColor = primaryTextColorBase
  });

  factory ColorsData.fromJson(Map<String, dynamic> json) => ColorsData(
        primaryColor: json["primaryColor"],
        secondaryColor: json["secondaryColor"],
        cardColor: json["cardColor"],
        infoColor: json["infoColor"],
        primaryTextColor: json["primaryTextColor"],
      );

  Map<String, dynamic> toJson() => {
        "primaryColor": primaryColor,
        "secondaryColor": secondaryColor,
        "cardColor": cardColor,
        "infoColor": infoColor,
        "primaryTextColor": primaryTextColor,
      };
}
