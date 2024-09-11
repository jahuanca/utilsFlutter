import 'package:flutter/material.dart' hide ButtonStyle;
import 'package:utils/src/ui/widgets/buttons/button_style_data.dart';
import 'package:utils/utils.dart';

class ButtonTypeData {
  //If it is a base type, the borderButton defined by the user is taken.
  ButtonTypeData({
    required this.type,
    required this.decoration,
    required this.textAndIconColor,
  });

  final ButtonType type;
  BoxDecoration decoration;
  Color textAndIconColor;
}

ButtonTypeData getTypeData(
  ButtonType type,
  ButtonStyle style,
) {
  ButtonStyleData styleData = getButtonStyleData(style);

  switch (type) {      
    case ButtonType.ghost:
      return ButtonTypeData(
        type: ButtonType.ghost,
        decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
              color: styleData.backgroundColor,
            ),
            borderRadius: BorderRadius.circular(borderRadius())),
        textAndIconColor: styleData.backgroundColor,
      );
    case ButtonType.link:
      return ButtonTypeData(
        type: ButtonType.link,
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        textAndIconColor: styleData.backgroundColor,
      );
    default:
      return ButtonTypeData(
        type: ButtonType.base,
        decoration: BoxDecoration(
            color: styleData.backgroundColor,
            border: Border.all(
              color: styleData.colorForTextIconAndBorder,
            ),
            borderRadius: BorderRadius.circular(borderRadius())),
        textAndIconColor: styleData.colorForTextIconAndBorder,
      );
  }
}

ButtonTypeData findButtonTypeData(List<ButtonTypeData> allTypes,
    ButtonType type, ButtonTypeData defaultType) {
  return allTypes.firstWhere((e) => e.type == type, orElse: () => defaultType);
}
