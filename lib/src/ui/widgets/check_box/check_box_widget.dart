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

  const CheckBoxWidget({
    required this.title,
    this.subtitle,
    this.padding,
    this.backgroundColor,
    this.checkBoxColor,
    this.isChecked = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    //todo: agregar error y borde en caso de error.
    return Container(
      padding: padding,
      child: Container(
        decoration: BoxDecoration(
            color: backgroundColor ?? cardColor(),
            border: Border.all(color: primaryColor()),
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
                  subtitle: subtitle == null ? null : Text(subtitle.orEmpty()),
                ))
          ],
        ),
      ),
    );
  }
}
