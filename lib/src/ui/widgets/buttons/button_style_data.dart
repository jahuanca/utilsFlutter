import 'package:flutter/material.dart' hide ButtonStyle;
import 'package:utils/utils.dart';

class ButtonStyleData {
  //If it is a base type, the borderButton defined by the user is taken.
  ButtonStyleData({
    required this.style,
    required this.backgroundColor,
    required this.colorForTextAndIcon,
    required this.colorForBorder,
  });

  ButtonStyle style;
  Color backgroundColor;
  Color colorForTextAndIcon;
  Color colorForBorder;
}

ButtonStyleData getButtonStyleData(ButtonStyle style){
  switch(style){
    case ButtonStyle.success:
      return ButtonStyleData(
        style: style, 
        backgroundColor: successColor(), 
        colorForTextAndIcon: Colors.white,
        colorForBorder: successColor(),
      );
    case ButtonStyle.info:
      return ButtonStyleData(
        style: style, 
        backgroundColor: infoColor(),
        colorForTextAndIcon: Colors.white,
        colorForBorder: infoColor(),
        );
    case ButtonStyle.alert:
      return ButtonStyleData(
        style: style, 
        backgroundColor: alertColor(),
        colorForTextAndIcon: Colors.white,
        colorForBorder: successColor(),
        );
    case ButtonStyle.danger:
      return ButtonStyleData(
        style: style, 
        backgroundColor: dangerColor(),
        colorForTextAndIcon: Colors.white,
        colorForBorder: dangerColor(),
        );
    case ButtonStyle.dark:
      return ButtonStyleData(
        style: style, 
        backgroundColor: darkColor(), 
        colorForTextAndIcon: Colors.white, 
        colorForBorder: darkColor());
    default:
      return ButtonStyleData(
        style: style, 
        backgroundColor: primaryColor(),
        colorForTextAndIcon: Colors.white,
        colorForBorder: primaryColor(),
        );
  }
}

ButtonStyleData findButtonStyleData(
  List<ButtonStyleData> allStyles,
  ButtonStyle style, 
  ButtonStyleData defaultStyle
) => allStyles.firstWhere((e) => e.style == style, orElse: () => defaultStyle);
