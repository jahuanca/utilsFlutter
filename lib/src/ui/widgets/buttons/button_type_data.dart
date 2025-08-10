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

  final ButtonTypeWidget type;
  BoxDecoration decoration;
  Color textAndIconColor;
}

ButtonTypeData getTypeData(
  ButtonTypeWidget type,
  ButtonStyleWidget style,
) {
  ButtonStyleData styleData = getButtonStyleData(style);

  switch (type) {      
    case ButtonTypeWidget.ghost:
      return ButtonTypeData(
        type: ButtonTypeWidget.ghost,
        decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
              color: styleData.backgroundColor,
            ),
            borderRadius: BorderRadius.circular(borderRadius())),
        textAndIconColor: styleData.backgroundColor,
      );
    case ButtonTypeWidget.link:
      return ButtonTypeData(
        type: ButtonTypeWidget.link,
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        textAndIconColor: styleData.backgroundColor,
      );
    default:
      return ButtonTypeData(
        type: ButtonTypeWidget.base,
        decoration: BoxDecoration(
            color: styleData.backgroundColor,
            border: Border.all(
              color: styleData.colorForBorder,
            ),
            borderRadius: BorderRadius.circular(borderRadius())),
        textAndIconColor: styleData.colorForTextAndIcon,
      );
  }
}

ButtonTypeData findButtonTypeData(List<ButtonTypeData> allTypes,
    ButtonTypeWidget type, ButtonTypeData defaultType) {
  return allTypes.firstWhere((e) => e.type == type, orElse: () => defaultType);
}
