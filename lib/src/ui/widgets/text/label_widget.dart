import 'package:flutter/material.dart';
import 'package:utils/utils.dart';

class LabelWidget extends StatelessWidget {
  final String label;
  final TextStyle? textStyleLabel;
  final EdgeInsetsGeometry? padding;

  const LabelWidget({
    super.key,
    required this.label,
    this.textStyleLabel,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle? textStyleSelected = textStyleLabel ?? labelStyle;
    return Container(
      padding: padding,
      child: Text(
        label.orEmpty(),
        style: textStyleSelected,
      ),
    );
  }
}
