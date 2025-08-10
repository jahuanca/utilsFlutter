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
  Color disabledColor;

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
  EnumAuth authentication;
  Widget Function(Widget)? wrapperWidgetInputs;

  DataConfig({
    this.primaryColor =  primaryColorBase,
    this.secondaryColor = secondColorBase,
    this.cardColor = cardColorBase,
    this.infoColor = infoColorBase,
    this.successColor = successColorBase,
    this.dangerColor = dangerColorBase,
    this.primaryTextColor = primaryTextColorBase,
    this.disabledColor = disabledColorBase,
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
    this.authentication = EnumAuth.none,
    this.wrapperWidgetInputs,
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
        disabledColor: json["disabledColor"],
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
        authentication: json["authentication"],
        wrapperWidgetInputs: json["wrapperWidgetInputs"],
      );

  Map<String, dynamic> toJson() => {
        "primaryColor": primaryColor,
        "secondaryColor": secondaryColor,
        "cardColor": cardColor,
        "dangerColor": dangerColor,
        "disabledColor": disabledColor,
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
        "authentication": authentication,
        "wrapperWidgetInputs": wrapperWidgetInputs,
      };
}
