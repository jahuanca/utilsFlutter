import 'package:flutter/material.dart';
import 'package:utils/src/core/text_styles.dart';
import 'package:utils/src/ui/widgets/utils.dart';
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
  final TextStyle? textStyleLabel;
  final bool showError;

  PasswordInputWidget({
    required this.hintText,
    this.icon,
    this.inputBorderCurrent,
    this.iconOverlay,
    this.onPressedIconOverlay,
    this.enabled = true,
    this.maxLength = _defaultMaxLength,
    this.textInputType = TextInputType.visiblePassword,
    this.isObscure = true,
    this.initialValue,
    this.textEditingController,
    this.isTextArea = false,
    this.label,
    this.onChanged,
    this.error,
    this.onTap,
    this.padding = noPadding,
    this.textStyleLabel,
    this.showError = false,
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
          labelWidget(size: size, label: label, textStyleLabel: textStyleLabel),
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
                      obscureText: isObscure,
                      minLines: 1,
                      maxLines: 1,
                      decoration: inputDecorationWidget(
                        prefixIcon: icon,
                        hintText: hintText,
                        heigthPadding: heigthPadding,
                        error: error, 
                        inputBorderSelected: inputBorderSelected),
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
          if(showError) errorContainerWidget(error: error),
        ],
      ),
    );
  }
}
