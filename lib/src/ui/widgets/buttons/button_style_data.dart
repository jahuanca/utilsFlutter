import 'package:flutter/material.dart' hide ButtonStyle;
import 'package:utils/utils.dart';

class ButtonStyleData {
  //If it is a base type, the borderButton defined by the user is taken.
  ButtonStyleData({
    required this.style,
    required this.backgroundColor,
    required this.colorForTextIconAndBorder,
  });

  ButtonStyle style;
  Color backgroundColor;
  Color colorForTextIconAndBorder;
}

ButtonStyleData getButtonStyleData(ButtonStyle style){
  switch(style){
    case ButtonStyle.success:
      return ButtonStyleData(
        style: style, 
        backgroundColor: successColor(), 
        colorForTextIconAndBorder: Colors.white);
    case ButtonStyle.info:
      return ButtonStyleData(
        style: style, 
        backgroundColor: infoColor(),
        colorForTextIconAndBorder: Colors.white);
    case ButtonStyle.alert:
      return ButtonStyleData(
        style: style, 
        backgroundColor: alertColor(),
        colorForTextIconAndBorder: Colors.white);
    case ButtonStyle.danger:
      return ButtonStyleData(
        style: style, 
        backgroundColor: dangerColor(),
        colorForTextIconAndBorder: Colors.white);
    default:
      return ButtonStyleData(
        style: style, 
        backgroundColor: primaryColor(),
        colorForTextIconAndBorder: Colors.white);
  }
}

ButtonStyleData findButtonStyleData(
  List<ButtonStyleData> allStyles,
  ButtonStyle style, 
  ButtonStyleData defaultStyle
) => allStyles.firstWhere((e) => e.style == style, orElse: () => defaultStyle);
