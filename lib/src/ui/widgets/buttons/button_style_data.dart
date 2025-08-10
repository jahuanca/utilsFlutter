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

  ButtonStyleWidget style;
  Color backgroundColor;
  Color colorForTextAndIcon;
  Color colorForBorder;
}

ButtonStyleData getButtonStyleData(ButtonStyleWidget style){
  switch(style){
    case ButtonStyleWidget.success:
      return ButtonStyleData(
        style: style, 
        backgroundColor: successColor(), 
        colorForTextAndIcon: Colors.white,
        colorForBorder: successColor(),
      );
    case ButtonStyleWidget.info:
      return ButtonStyleData(
        style: style, 
        backgroundColor: infoColor(),
        colorForTextAndIcon: Colors.white,
        colorForBorder: infoColor(),
        );
    case ButtonStyleWidget.alert:
      return ButtonStyleData(
        style: style, 
        backgroundColor: alertColor(),
        colorForTextAndIcon: Colors.white,
        colorForBorder: successColor(),
        );
    case ButtonStyleWidget.danger:
      return ButtonStyleData(
        style: style, 
        backgroundColor: dangerColor(),
        colorForTextAndIcon: Colors.white,
        colorForBorder: dangerColor(),
        );
    case ButtonStyleWidget.dark:
      return ButtonStyleData(
        style: style, 
        backgroundColor: darkColor(), 
        colorForTextAndIcon: Colors.white, 
        colorForBorder: darkColor());
    case ButtonStyleWidget.disabled:
      return ButtonStyleData(
        style: style, 
        backgroundColor: disabledColor(), 
        colorForTextAndIcon: Colors.white, 
        colorForBorder: disabledColor());
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
  ButtonStyleWidget style, 
  ButtonStyleData defaultStyle
) => allStyles.firstWhere((e) => e.style == style, orElse: () => defaultStyle);
