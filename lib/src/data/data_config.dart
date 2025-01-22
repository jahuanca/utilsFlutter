import 'package:flutter/material.dart';
import 'package:utils/src/core/colors.dart';
import 'package:utils/src/core/dimens.dart';
import 'package:utils/src/core/strings.dart';
import 'package:utils/src/core/text_styles.dart';
import 'package:utils/src/data/enum_auth.dart';

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
  double dimensionButton;

  TextStyle? titleTextAppBarStyle;
  TextStyle? labelStyle;
  TextStyle? hintStyle;
  InputBorder? inputBorder;
  bool showLog;
  String? urlServer;
  String basicAuthUsername;
  String basicAuthPassword;
  EnumAuth enumAuth;

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
    this.dimensionButton = dimensionButtonBase,
    this.showLog = true,
    this.urlServer,
    this.basicAuthUsername = emptyString,
    this.basicAuthPassword = emptyString,

    this.titleTextAppBarStyle,
    this.inputBorder,
    this.hintStyle,
    this.labelStyle,
    this.enumAuth = EnumAuth.none,
  }){
    titleTextAppBarStyle ??= titleTextAppBarStyleBase();
    hintStyle ??= hintStyleBase();
  }

  factory DataConfig.fromJson(Map<String, dynamic> json) => DataConfig(
        primaryColor: json["primaryColor"],
        secondaryColor: json["secondaryColor"],
        cardColor: json["cardColor"],
        infoColor: json["infoColor"],
        dangerColor: json["dangerColor"],
        hintColor: json["hintColor"],
        primaryTextColor: json["primaryTextColor"],
        backgroundPageColor: json["backgroundPageColor"],

        borderRadius: json["borderRadius"],
        dimensionInput: json["dimensionInput"],
        dimensionButton: json["dimensionButton"],

        titleTextAppBarStyle: json["titleTextAppBarStyle"],
        hintStyle: json["hintStyle"],
        inputBorder: json["inputBorder"],
        showLog: json["showLog"],
        urlServer: json["urlServer"],
        basicAuthUsername: json["basicAuthUsername"],
        basicAuthPassword: json["basicAuthPassword"],
        labelStyle: json["labelStyle"],
        enumAuth: json["enumAuth"],
      );

  Map<String, dynamic> toJson() => {
        "primaryColor": primaryColor,
        "secondaryColor": secondaryColor,
        "cardColor": cardColor,
        "dangerColor": dangerColor,
        "hintColor": hintColor,
        "infoColor": infoColor,
        "successColor": successColor,
        "primaryTextColor": primaryTextColor,
        "backgroundPageColor": backgroundPageColor,

        "dimensionInput": dimensionInput,
        "dimensionButton": dimensionButton,
        "borderRadius": borderRadius,

        "titleTextAppBarStyle": titleTextAppBarStyle,
        "hintStyle": hintStyle,
        "inputBorder": inputBorder,
        "showLog": showLog,
        "urlServer": urlServer,
        "basicAuthUsername": basicAuthUsername,
        "basicAuthPassword": basicAuthPassword,
        "labelStyle": labelStyle,
        "enumAuth": enumAuth,
      };
}
