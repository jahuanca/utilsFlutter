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

  InputWidget({
    required this.hintText,
    this.iconOverlay,
    this.onPressedIconOverlay,
    this.enabled = true,
    this.maxLength = 20,
    this.textInputType = TextInputType.name,
    this.isObscure = false,
    this.initialValue,
    this.textEditingController,
    this.isTextArea = false,
    this.label,
    this.onChanged,
    this.error,
    this.onTap,
    this.padding = const EdgeInsets.all(0)
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
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
            child: Container(
                height: isTextArea
                    ? size.height * dimensionInput() * 1.5
                    : size.height * dimensionInput(),
                width: size.width,
                decoration: BoxDecoration(),
                child: Stack(
                  children: [
                    TextFormField(
                      enabled: enabled,
                      initialValue: initialValue,
                      maxLength: maxLength,
                      keyboardType: textInputType,
                      obscureText: isObscure,
                      maxLines: isTextArea ? 5 : 1,
                      decoration: InputDecoration(
                        border:
                            error == null ? inputBorder() : inputBorderError(),
                        enabledBorder:
                            error == null ? inputBorder() : inputBorderError(),
                        disabledBorder:
                            error == null ? inputBorder() : inputBorderError(),
                        focusedBorder:
                            error == null ? inputBorder() : inputBorderError(),
                        filled: true,
                        fillColor: cardColor(),
                        contentPadding: isTextArea
                            ? contentPaddingTextArea
                            : contentPaddingInputs,
                        counterText: '',
                        counterStyle: TextStyle(fontSize: 0),
                        hintText: hintText,
                        hintStyle: primaryHintStyle(),
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
                )),
          ),
        ],
      ),
    );
  }
}