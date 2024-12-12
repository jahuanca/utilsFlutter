import 'package:flutter/material.dart';
import 'package:utils/src/core/dimens.dart';
import 'package:utils/src/core/input_borders.dart';
import 'package:utils/src/core/text_styles.dart';
import 'package:utils/utils.dart';

const _defaultMaxLength = 20;
class PasswordInputWidget extends StatelessWidget {
  
  final String hintText;
  final bool enabled;
  final int maxLength;
  final TextInputType textInputType;
  final bool isObscure;
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

  PasswordInputWidget({
    required this.hintText,
    this.icon,
    this.inputBorderCurrent,
    this.iconOverlay,
    this.onPressedIconOverlay,
    this.enabled = true,
    this.maxLength = _defaultMaxLength,
    this.textInputType = TextInputType.visiblePassword,
    this.isObscure = false,
    this.initialValue,
    this.textEditingController,
    this.isTextArea = false,
    this.label,
    this.onChanged,
    this.error,
    this.onTap,
    this.padding = noPadding,
  });

  @override
  Widget build(BuildContext context) {
    final inputBorderSelected = inputBorderCurrent ?? inputBorder();

    final Size size = MediaQuery.of(context).size;
    final double heightInput = isTextArea ? size.height * dimensionInput()  * 1.5 : size.height * dimensionInput();
    final double heigthPadding = heightInput * 0.1;

    return Padding(
      padding: padding,
      child: Column(
        children: [
          if (label != null)
            Container(
              alignment: Alignment.centerLeft,
              height: size.height * dimensionInput(),
              child: Text(
                label.orEmpty(),
              ),
            ),
          GestureDetector(
            onTap: onTap,
            child: Stack(
                  children: [
                    TextFormField(
                      style: primaryTextStyleBase(),
                      enabled: enabled,
                      initialValue: initialValue,
                      maxLength: maxLength,
                      keyboardType: textInputType,
                      obscureText: true,
                      minLines: 1,
                      maxLines: 1,
                      decoration: InputDecoration(
                        isDense: false,
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
                        fillColor: cardColor(),
                        contentPadding: isTextArea
                            ? contentPaddingTextArea
                            : EdgeInsets.symmetric(vertical: heigthPadding, horizontal: 25),
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
                          )
                        )
                      )
                  ],
                )
          ),
        ],
      ),
    );
  }
}
