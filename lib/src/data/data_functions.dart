
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:utils/src/core/colors.dart';
import 'package:utils/src/core/dimens.dart';
import 'package:utils/src/core/strings.dart';

//colors
Color primaryColor() => GlobalConfiguration().get(primaryColorString) ?? primaryColorBase;
Color secondaryColor() => GlobalConfiguration().get(secondaryColorString) ?? secondColorBase;
Color cardColor() => GlobalConfiguration().get(cardColorString) ?? cardColorBase;
Color successColor() => GlobalConfiguration().get(successColorString) ?? successColorBase;
Color infoColor() => GlobalConfiguration().get(infoColorString) ?? infoColorBase;
Color alertColor() => GlobalConfiguration().get(alertColorString) ?? alertColorBase;
Color dangerColor() => GlobalConfiguration().get(dangerColorString) ?? dangerColorBase;
Color primaryTextColor() => GlobalConfiguration().get(primaryTextColorString) ?? primaryTextColorBase;
Color backgroundPageColor() => GlobalConfiguration().get(backgroundPageColorString) ?? backgroundPageColorBase;

//dimens
double borderRadius() => GlobalConfiguration().get(borderRadiusString) ?? borderRadiusBase;
double dimensionInput() => GlobalConfiguration().get(dimensionInputString) ?? dimensionInputBase;

//styles
TextStyle titleTextAppBarStyle() => GlobalConfiguration().get(titleTextAppBarStyleString) ?? TextStyle();