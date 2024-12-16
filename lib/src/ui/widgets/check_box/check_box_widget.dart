import 'package:flutter/material.dart';
import 'package:utils/src/core/extensions.dart';
import 'package:utils/src/data/data_functions.dart';

class CheckBoxWidget extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final Color? checkBoxColor;
  final bool? isChecked;
  final void Function(bool?)? onChanged;
  final String? label;
  final TextStyle? styleLabel;
  final String? error;
  final bool showError;

  const CheckBoxWidget({
    required this.title,
    this.subtitle,
    this.padding,
    this.backgroundColor,
    this.checkBoxColor,
    this.isChecked = false,
    this.onChanged,
    this.label,
    this.styleLabel,
    this.showError = false,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final double labelHeight = size.height * dimensionInput() * 0.6;
    final double checkHeight = size.height * dimensionInput() * 0.59;

    return Container(
      padding: padding,
      child: Column(
        children: [
          if (label != null)
            Container(
              alignment: Alignment.centerLeft,
              height: labelHeight,
              child: Text(
                label.orEmpty(),
                style: styleLabel ?? labelStyle(),
              ),
            ),
          Container(
            height: checkHeight,
            decoration: BoxDecoration(
                color: backgroundColor ?? cardColor(),
                border: Border.all(
                    color: error == null ? primaryColor() : dangerColor()),
                borderRadius: BorderRadius.circular(borderRadius())),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Checkbox(
                        activeColor: checkBoxColor ?? primaryColor(),
                        value: isChecked,
                        onChanged: onChanged)),
                Expanded(
                    flex: 3,
                    child: ListTile(
                      dense: true,
                      title: Text(title.orEmpty()),
                      subtitle:
                          subtitle == null ? null : Text(subtitle.orEmpty()),
                    ))
              ],
            ),
          ),
          if (showError)
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
