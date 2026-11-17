
import 'package:flutter/material.dart';
import 'package:utils/src/core/colors.dart';
import 'package:utils/src/core/constants.dart';
import 'package:utils/src/core/dimens.dart';
import 'package:utils/src/core/input_borders.dart';
import 'package:utils/src/core/text_styles.dart';
import 'package:utils/utils.dart';

//colors
ThemeConfig? get theme => config.themeConfig;

Color get primaryColor => theme?.colors?.primaryColor ?? primaryColorBase;
Color get secondaryColor => theme?.colors?.secondaryColor ?? secondColorBase;
Color get cardColor => theme?.colors?.cardColor ?? cardColorBase;
Color get successColor => theme?.colors?.successColor ?? successColorBase;
Color get infoColor => theme?.colors?.infoColor ?? infoColorBase;
Color get alertColor => theme?.colors?.alertColor ?? alertColorBase;
Color get dangerColor => theme?.colors?.dangerColor ?? dangerColorBase;
Color get darkColor =>  theme?.colors?.darkColor ?? darkColorBase;
Color get disabledColor => theme?.colors?.disabledColor ?? disabledColorBase;
Color get primaryTextColor => theme?.colors?.primaryTextColor ?? primaryTextColorBase;
Color get hintColor => theme?.colors?.hintColor ?? hintColorBase;
Color get backgroundPageColor => theme?.colors?.backgroundPageColor ?? backgroundPageColorBase;

//dimens
double get borderRadius => theme?.dimens?.borderRadius ?? borderRadiusBase;
double get dimensionInput => theme?.dimens?.dimensionInput ?? dimensionInputBase;
double get dimensionButton => theme?.dimens?.dimensionButton ?? dimensionButtonBase;

//styles
TextStyle get titleTextAppBarStyle => theme?.textStyles?.titleTextAppBarStyle ?? TextStyle();
TextStyle get hintStyle => config.themeConfig?.textStyles?.hintStyle ?? hintStyleBase();
TextStyle? get labelStyle => config.themeConfig?.textStyles?.labelStyle;

//inputBorders
InputBorder get inputBorder => config.inputBorder ?? inputBorderBase();

//bools
bool get showLog => config.networkConfig?.showLog ?? true;

String get urlServer => config.networkConfig?.urlServer ?? emptyString;
EnumAuth get authentication => config.networkConfig?.authentication ?? EnumAuth.none;
String get basicAuthUsername => config.networkConfig?.basicAuthUsername ?? emptyString;
String get basicAuthPassword => config.networkConfig?.basicAuthPassword ?? emptyString;

//functions
Widget Function(Widget)? get wrapperWidgetInputs => config.wrapperWidgetInputs;

//int
int get timeOfValue => config.networkConfig?.valueOfTimeOut ?? defaultTimeOut;