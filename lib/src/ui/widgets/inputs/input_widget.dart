import 'package:flutter/material.dart';
import 'package:utils/src/core/dimens.dart';
import 'package:utils/src/core/input_borders.dart';
import 'package:utils/src/core/text_styles.dart';
import 'package:utils/src/data/data_functions.dart';

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
  final double? height;

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
      this.padding = const EdgeInsets.all(0),
      this.isDense = true,
      this.minLines = 1,
      this.maxLines = 1,
      this.focusNode,
      this.showError = true,
      this.backgroundColor,
      this.height,
      });

  @override
  Widget build(BuildContext context) {
    final inputBorderSelected = inputBorderCurrent ?? inputBorder();

    final Size size = MediaQuery.of(context).size;
    final double heightInput = isTextArea
        ? size.height * dimensionInput() * 1.5
        : size.height * dimensionInput();
    final double heightPadding = height ?? (heightInput * 0.1);

    return Padding(
      padding: padding,
      child: Column(
        children: [
          if (label != null)
            Container(
              alignment: Alignment.centerLeft,
              height: size.height * dimensionInput(),
              child: Text(
                label ?? '',
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
                            vertical: heightPadding, horizontal: 25),
                    counterText: '',
                    counterStyle: TextStyle(fontSize: 0),
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
              error ?? '',
              style: TextStyle(color: dangerColor()),
            ),
          ),
        ],
      ),
    );
  }
}
