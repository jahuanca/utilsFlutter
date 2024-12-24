import 'package:flutter/material.dart';
import 'package:utils/src/ui/utils/strings.dart';
import 'package:utils/src/ui/widgets/utils.dart';
import 'package:utils/utils.dart';

class DropdownWidget extends StatelessWidget {
  final String? label;
  final TextStyle? textStyleLabel;
  final EdgeInsetsGeometry? padding;
  final String? error;
  final Color? backgroundColor;
  final InputBorder? inputBorderCurrent;
  final bool showError;
  final void Function(dynamic)? onChanged;
  final dynamic value;
  final List<dynamic>? items;
  final String hintText;
  final IconData? iconData;
  final Color? iconEnabledColor;
  final Color? iconDisabledColor;

  const DropdownWidget({
    this.hintText = dropdownHintString,
    this.padding,
    this.label,
    this.textStyleLabel,
    this.error,
    this.backgroundColor,
    this.inputBorderCurrent,
    this.showError = false,
    this.onChanged,
    this.value,
    this.items,
    this.iconData,
    this.iconEnabledColor,
    this.iconDisabledColor,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double heightInput = size.height * dimensionInput();
    final inputBorderSelected = inputBorderCurrent ?? inputBorder();
    final double heigthPadding = heightInput * 0.1;

    return Container(
      padding: padding,
      child: Column(
        children: [
          labelWidget(size: size, label: label, textStyleLabel: textStyleLabel),
          Container(
            decoration: boxDecorationWidget(
                error: error, backgroundColor: backgroundColor),
            child: DropdownButtonFormField<dynamic>(
              icon: iconData == null ? null : Icon(iconData),
              iconEnabledColor: iconEnabledColor,
              iconDisabledColor: iconDisabledColor,
              decoration: inputDecorationWidget(
                error: error,
                inputBorderSelected: inputBorderSelected,
                heigthPadding: heigthPadding,
              ),
              hint: Text(hintText),
              isExpanded: true,
              borderRadius: BorderRadius.circular(borderRadius()),
              items: items == null
                  ? []
                  : items
                      ?.map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ),
                      )
                      .toList(),
              value: value,
              onChanged: onChanged,
            ),
          ),
          if (showError) errorContainerWidget(error: error),
        ],
      ),
    );
  }
}
