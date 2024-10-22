
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:utils/src/core/colors.dart';
import 'package:utils/src/core/dimens.dart';
import 'package:utils/src/core/input_borders.dart';
import 'package:utils/src/core/strings.dart';
import 'package:utils/src/core/text_styles.dart';

//colors
Color primaryColor() => GlobalConfiguration().get(primaryColorString) ?? primaryColorBase;
Color secondaryColor() => GlobalConfiguration().get(secondaryColorString) ?? secondColorBase;
Color cardColor() => GlobalConfiguration().get(cardColorString) ?? cardColorBase;
Color successColor() => GlobalConfiguration().get(successColorString) ?? successColorBase;
Color infoColor() => GlobalConfiguration().get(infoColorString) ?? infoColorBase;
Color alertColor() => GlobalConfiguration().get(alertColorString) ?? alertColorBase;
Color dangerColor() => GlobalConfiguration().get(dangerColorString) ?? dangerColorBase;
Color darkColor() => GlobalConfiguration().get(darkColorString) ?? darkColorBase;
Color primaryTextColor() => GlobalConfiguration().get( primaryTextColorString) ?? primaryTextColorBase;
Color hintColor() => GlobalConfiguration().get(hintColorString) ?? hintColorBase;
Color backgroundPageColor() => GlobalConfiguration().get(backgroundPageColorString) ?? backgroundPageColorBase;

//dimens
double borderRadius() => GlobalConfiguration().get(borderRadiusString) ?? borderRadiusBase;
double dimensionInput() => GlobalConfiguration().get(dimensionInputString) ?? dimensionInputBase;

//styles
TextStyle titleTextAppBarStyle() => GlobalConfiguration().get(titleTextAppBarStyleString) ?? TextStyle();
TextStyle hintStyle() => GlobalConfiguration().get(hintStyleString) ?? hintStyleBase();

//inputBorders
InputBorder inputBorder() => GlobalConfiguration().get(inputBorderString) ?? inputBorderBase();

//bools
bool showLog()=> GlobalConfiguration().get(showLogString) ?? true;

String urlServer() => GlobalConfiguration().get(urlServerString) ?? emptyString;
String basicAuthUsername() => GlobalConfiguration().get(basicAuthUsernameString) ?? emptyString;
String basicAuthPassword() => GlobalConfiguration().get(basicAuthPasswordString) ?? emptyString;