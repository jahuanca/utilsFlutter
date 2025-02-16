import 'package:flutter/material.dart' hide ButtonStyle;
import 'package:utils/src/core/text_styles.dart';
import 'package:utils/src/ui/widgets/buttons/button_type_data.dart';
import 'package:utils/utils.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final IconData? iconData;
  final void Function()? onTap;
  final EdgeInsetsGeometry padding;
  final ButtonType buttonType;
  final ButtonStyle buttonStyle;
  final double elevation;
  final Color? shadowColor;
  final double fontSize;
  final BasicPositions iconPosition;

  ButtonWidget({
    required this.text,
    this.iconData,
    this.onTap,
    this.shadowColor,
    this.padding = noPadding,
    this.buttonType = ButtonType.base,
    this.buttonStyle = ButtonStyle.base,
    this.elevation = defaultDouble,
    this.fontSize = 20,
    this.iconPosition = BasicPositions.left,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final selectedTypeButton = getTypeData(buttonType, buttonStyle);
    final Widget iconOfContainer = ChildOrElseWidget(
      condition: iconData != null,
      child: Icon(
        iconData,
        color: selectedTypeButton.textAndIconColor,
      ),
    );

    return Padding(
      padding: padding,
      child: Material(
        borderRadius: BorderRadius.circular(borderRadius()),
        elevation: elevation,
        shadowColor: shadowColor,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            height: size.height * dimensionButton(),
            width: size.width,
            decoration: selectedTypeButton.decoration,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (iconData != null)
                  Expanded(
                      child: ChildOrElseWidget(
                          condition: (iconPosition == BasicPositions.left),
                          child: iconOfContainer),
                      flex: 1),
                Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(text,
                          style: botonStyle(
                              fontSize: fontSize,
                              textColor: selectedTypeButton.textAndIconColor)),
                    ),
                    flex: 3),
                if (iconData != null)
                  Expanded(
                      child: ChildOrElseWidget(
                          condition: (iconPosition == BasicPositions.right),
                          child: iconOfContainer),
                      flex: 1),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final baseType = ButtonTypeData(
    type: ButtonType.base,
    decoration: BoxDecoration(
        color: cardColor(),
        border: Border.all(
          color: primaryColor(),
        ),
        borderRadius: BorderRadius.circular(borderRadius())),
    textAndIconColor: Colors.white,
  );

  final ghost = ButtonTypeData(
    type: ButtonType.ghost,
    decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: primaryColor(),
        ),
        borderRadius: BorderRadius.circular(borderRadius())),
    textAndIconColor: primaryColor(),
  );

  final link = ButtonTypeData(
    type: ButtonType.link,
    decoration: BoxDecoration(
      color: Colors.transparent,
    ),
    textAndIconColor: primaryColor(),
  );
}
