import 'package:flutter/material.dart';
import 'package:utils/src/core/text_styles.dart';
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
  final String idLabel;
  final String idValue;

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
    this.idLabel = 'id',
    this.idValue = 'name',
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
            height: heightWidget(size: size),
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
              style: primaryTextStyleBase(),
              items: items == null
                  ? []
                  : items?.map(
                      (e) {
                        switch (e.runtimeType) {
                          case String:
                            return DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            );
                          default:
                            return DropdownMenuItem(
                              value: e.toJson()[idValue],
                              child: Text('${e.toJson()[idLabel]}'),
                            );
                        }
                      },
                    ).toList(),
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
