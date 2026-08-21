
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:utils/src/core/colors.dart';
import 'package:utils/src/core/constants.dart';
import 'package:utils/src/core/dimens.dart';
import 'package:utils/src/core/input_borders.dart';
import 'package:utils/src/core/strings.dart';
import 'package:utils/src/core/text_styles.dart';
import 'package:utils/utils.dart';

//colors
final theme = config.themeConfig;

Color primaryColor() => theme!.colors!.primaryColor;
Color secondaryColor() => theme!.colors!.secondaryColor;
Color cardColor() => theme!.colors!.cardColor;
Color successColor() => theme!.colors!.successColor;
Color infoColor() => theme!.colors!.infoColor;
Color alertColor() => theme!.colors!.alertColor;
Color dangerColor() => theme!.colors!.dangerColor;
Color darkColor() => GlobalConfiguration().get(darkColorString) ?? darkColorBase;
Color disabledColor() => GlobalConfiguration().get(disabledColorString) ?? disabledColorBase;
Color primaryTextColor() => GlobalConfiguration().get( primaryTextColorString) ?? primaryTextColorBase;
Color hintColor() => GlobalConfiguration().get(hintColorString) ?? hintColorBase;
Color backgroundPageColor() => GlobalConfiguration().get(backgroundPageColorString) ?? backgroundPageColorBase;

//dimens
double borderRadius() => GlobalConfiguration().get(borderRadiusString) ?? borderRadiusBase;
double dimensionInput() => GlobalConfiguration().get(dimensionInputString) ?? dimensionInputBase;
double dimensionButton() => GlobalConfiguration().get(dimensionButtonString) ?? dimensionButtonBase;

//styles
TextStyle titleTextAppBarStyle() => GlobalConfiguration().get(titleTextAppBarStyleString) ?? TextStyle();
TextStyle hintStyle() => GlobalConfiguration().get(hintStyleString) ?? hintStyleBase();
TextStyle? labelStyle() => GlobalConfiguration().get(labelStyleString);

//inputBorders
InputBorder inputBorder() => GlobalConfiguration().get(inputBorderString) ?? inputBorderBase();

//bools
bool showLog()=> config.networkConfig?.showLog ?? true;

String urlServer() => config.networkConfig?.urlServer ?? emptyString;
EnumAuth authentication() => config.networkConfig?.authentication ?? EnumAuth.none;
String basicAuthUsername() => config.networkConfig?.basicAuthUsername ?? emptyString;
String basicAuthPassword() => config.networkConfig?.basicAuthPassword ?? emptyString;

//functions
Widget Function(Widget)? wrapperWidgetInputs()=> GlobalConfiguration().get(wrapperWidgetInputsString);

//int
int timeOfValue() => config.networkConfig?.valueOfTimeOut ?? defaultTimeOut;