import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:utils/src/core/text_styles.dart';
import 'package:utils/src/ui/widgets/utils.dart';
import 'package:utils/utils.dart';

const int _minLinesDefault = 1;
const int _maxLinesDefault = 1;

// ignore: must_be_immutable
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
  final Widget? iconOverlay;
  final EdgeInsetsGeometry padding;
  final InputBorder? inputBorderCurrent;
  final Icon? icon;
  final bool isDense;
  final int minLines;
  final int maxLines;
  final FocusNode? focusNode;
  final bool showError;
  final Color? backgroundColor;
  final Color? backgroundColorIconOverlay;
  final TextStyle? textStyleLabel;
  final List<TextInputFormatter>? inputFormatters;
  final bool isAlignLabel;
  final Widget Function(Widget)? wrapperWidget;

  InputWidget({
    required this.hintText,
    this.icon,
    this.inputBorderCurrent,
    this.iconOverlay,
    this.onPressedIconOverlay,
    this.enabled = true,
    this.maxLength = maxLengthDefault,
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
    this.backgroundColorIconOverlay,
    this.showError = false,
    this.backgroundColor,
    this.textStyleLabel,
    this.inputFormatters,
    this.isAlignLabel = false,
    this.wrapperWidget,
  });

  @override
  Widget build(BuildContext context) {
    final inputBorderSelected = inputBorderCurrent ?? inputBorder();

    final Size size = MediaQuery.of(context).size;
    final double heightInput = isTextArea
        ? size.height * dimensionInput() * 5
        : size.height * dimensionInput();
    final double heigthPadding = heightInput * 0.1;
    final Widget Function(Widget)? wrapperSelected = wrapperWidgetInputs() ?? wrapperWidget;

    Widget content = Padding(
      padding: padding,
      child: Column(
        children: [
          labelWidget(
            size: size, 
            label: label, 
            textStyleLabel: textStyleLabel,
            heigthPadding: isAlignLabel ? (heigthPadding * 2) : defaultDouble,
          ),
          GestureDetector(
            onTap: onTap,
            child: Stack(
              children: [
                TextFormField(
                  inputFormatters: inputFormatters,
                  focusNode: focusNode,
                  style: primaryTextStyleBase(),
                  enabled: enabled,
                  initialValue: initialValue,
                  maxLength: maxLength,
                  keyboardType: textInputType,
                  minLines: minLines,
                  maxLines: maxLines,
                  decoration: inputDecorationWidget(
                    hintText: hintText,
                    isDense: isDense,
                    prefixIcon: icon,
                    error: error,
                    inputBorderSelected: inputBorderSelected,
                    heigthPadding: heigthPadding,
                    backgroundColor: backgroundColor,
                  ),
                  controller: textEditingController,
                  onChanged: onChanged,
                  textAlign: TextAlign.left,
                ),
                if (iconOverlay != null)
                  Container(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        color: backgroundColorIconOverlay,
                        onPressed: onPressedIconOverlay,
                        icon: iconOverlay!,
                      )),
              ],
            ),
          ),
          if (showError) errorContainerWidget(error: error),
        ],
      ),
    );

    if(wrapperSelected == null){
      return content;
    }else{
      return wrapperSelected(content);
    }
  }
}
