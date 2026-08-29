import 'package:utils/src/core/colors.dart';
import 'package:utils/src/core/dimens.dart';
import 'package:utils/src/core/text_styles.dart';
import 'package:flutter/material.dart';

class ThemeConfig {
  ColorsApp? colors;
  DimensConfig? dimens;
  TextStyleConfig? textStyles;
  
  ThemeConfig({
    this.colors,
    this.dimens,
    this.textStyles,
  }) {
    colors ??= ColorsApp();
    dimens ??= DimensConfig();
    textStyles ??= TextStyleConfig();
  }
}

class ColorsApp {
  final Color primaryColor;
  final Color secondaryColor;
  final Color cardColor;
  final Color primaryTextColor;
  final Color hintColor;
  final Color backgroundPageColor;

  final Color infoColor;
  final Color dangerColor;
  final Color alertColor;
  final Color successColor;
  final Color disabledColor;

  ColorsApp({
    this.primaryColor = primaryColorBase,
    this.secondaryColor = secondColorBase,
    this.cardColor = cardColorBase,
    this.infoColor = infoColorBase,
    this.successColor = successColorBase,
    this.alertColor = alertColorBase,
    this.dangerColor = dangerColorBase,
    this.primaryTextColor = primaryTextColorBase,
    this.disabledColor = disabledColorBase,
    this.hintColor = hintColorBase,
    this.backgroundPageColor = backgroundPageColorBase,
  });

}

class DimensConfig {
  double borderRadius;
  double dimensionInput;
  double dimensionButton;

  DimensConfig({
    this.borderRadius = borderRadiusBase,
    this.dimensionInput = dimensionInputBase,
    this.dimensionButton = dimensionButtonBase,
  });

  factory DimensConfig.fromJson(Map<String, dynamic> json) => DimensConfig(
    borderRadius: json["borderRadius"],
        dimensionInput: json["dimensionInput"],
        dimensionButton: json["dimensionButton"],
  );

  Map<String, dynamic> toJson() => {
        "dimensionInput": dimensionInput,
        "dimensionButton": dimensionButton,
        "borderRadius": borderRadius,
  };
}

class TextStyleConfig {
  TextStyle? titleTextAppBarStyle;
  TextStyle? labelStyle;
  TextStyle? hintStyle;

  TextStyleConfig({
    this.titleTextAppBarStyle,
    this.hintStyle,
    this.labelStyle,
  }) {
    titleTextAppBarStyle ??= titleTextAppBarStyleBase();
    hintStyle ??= hintStyleBase();
  }
}