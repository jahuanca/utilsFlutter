import 'package:flutter/material.dart';
import 'package:utils/src/core/dimens.dart';
import 'package:utils/src/core/input_borders.dart';
import 'package:utils/src/core/text_styles.dart';
import 'package:utils/utils.dart';

const int _minLinesDefault = 1; 
const int _maxLinesDefault = 1; 

class InputWidget extends StatelessWidget {
  final String hintText;
  final bool enabled;
  final int maxLength;
  final TextInputType textInputType;
  final String? initialValue;
  final String? label;
  final String? error;
  final TextEditingController? textEditingController;
  final bool isTextArea;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final void Function()? onPressedIconOverlay;
  final IconData? iconOverlay;
  final EdgeInsetsGeometry padding;
  final InputBorder? inputBorderCurrent;
  final Icon? icon;
  final bool isDense;
  final int minLines;
  final int maxLines;
  final FocusNode? focusNode;
  final bool showError;
  final Color? backgroundColor;
  final TextStyle? styleLabel;

  InputWidget(
      {required this.hintText,
      this.icon,
      this.inputBorderCurrent,
      this.iconOverlay,
      this.onPressedIconOverlay,
      this.enabled = true,
      this.maxLength = 20,
      this.textInputType = TextInputType.name,
      this.initialValue,
      this.textEditingController,
      this.isTextArea = false,
      this.label,
      this.onChanged,
      this.error,
      this.onTap,
      this.padding = noPadding,
      this.isDense = true,
      this.minLines = _minLinesDefault,
      this.maxLines = _maxLinesDefault,
      this.focusNode,
      this.showError = false,
      this.backgroundColor,
      this.styleLabel,
      });

  @override
  Widget build(BuildContext context) {
    final inputBorderSelected = inputBorderCurrent ?? inputBorder();

    final Size size = MediaQuery.of(context).size;
    final double heightInput = isTextArea
        ? size.height * dimensionInput() * 1.5
        : size.height * dimensionInput();
    final double heigthPadding = heightInput * 0.1;

    return Padding(
      padding: padding,
      child: Column(
        children: [
          if (label != null)
            Container(
              alignment: Alignment.centerLeft,
              height: size.height * dimensionInput() * 0.6,
              child: Text(
                label.orEmpty(),
                style: styleLabel ?? labelStyle(),
              ),
            ),
          GestureDetector(
            onTap: onTap,
            child: Stack(
              children: [
                TextFormField(
                  focusNode: focusNode,
                  style: primaryTextStyleBase(),
                  enabled: enabled,
                  initialValue: initialValue,
                  maxLength: maxLength,
                  keyboardType: textInputType,
                  minLines: minLines,
                  maxLines: maxLines,
                  decoration: InputDecoration(
                    isDense: isDense,
                    prefixIcon: icon,
                    border: error == null
                        ? inputBorderSelected
                        : inputBorderError(),
                    enabledBorder: error == null
                        ? inputBorderSelected
                        : inputBorderError(),
                    disabledBorder: error == null
                        ? inputBorderSelected
                        : inputBorderError(),
                    focusedBorder: error == null
                        ? inputBorderSelected
                        : inputBorderError(),
                    filled: true,
                    fillColor: backgroundColor ?? cardColor(),
                    contentPadding: isTextArea
                        ? contentPaddingTextArea
                        : EdgeInsets.symmetric(
                            vertical: heigthPadding, horizontal: 25),
                    counterText: emptyString,
                    counterStyle: TextStyle(fontSize: defaultDouble),
                    hintText: hintText,
                    hintStyle: hintStyle(),
                  ),
                  controller: textEditingController,
                  onChanged: onChanged,
                  textAlign: TextAlign.left,
                ),
                if (iconOverlay != null)
                  Container(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                          onPressed: onPressedIconOverlay,
                          icon: Icon(
                            iconOverlay,
                            color: infoColor(),
                          )))
              ],
            ),
          ),
          if(showError)
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              error.orEmpty(),
              style: TextStyle(color: dangerColor()),
            ),
          ),
        ],
      ),
    );
  }
}
