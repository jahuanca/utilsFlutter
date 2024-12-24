import 'package:flutter/material.dart';
import 'package:utils/src/core/input_borders.dart';
import 'package:utils/utils.dart';

class DropdownWidget extends StatelessWidget {
  final String? label;
  final TextStyle? styleLabel;
  final EdgeInsetsGeometry? padding;
  final String? error;
  final Color? backgroundColor;
  final InputBorder? inputBorderCurrent;
  final bool showError;

  const DropdownWidget({
    this.padding,
    this.label,
    this.styleLabel,
    this.error,
    this.backgroundColor,
    this.inputBorderCurrent,
    this.showError = false,
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
          if (label != null)
            Container(
              alignment: Alignment.centerLeft,
              height: size.height * dimensionInput() * 0.6,
              child: Text(
                label.orEmpty(),
                style: styleLabel ?? labelStyle(),
              ),
            ),
          Container(
            decoration: BoxDecoration(
                color: backgroundColor ?? cardColor(),
                border: Border.all(
                    color: error == null ? primaryColor() : dangerColor()),
                borderRadius: BorderRadius.circular(borderRadius())),
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    vertical: heigthPadding, horizontal: 25),
                border:
                    error == null ? inputBorderSelected : inputBorderError(),
                enabledBorder:
                    error == null ? inputBorderSelected : inputBorderError(),
                disabledBorder:
                    error == null ? inputBorderSelected : inputBorderError(),
                focusedBorder:
                    error == null ? inputBorderSelected : inputBorderError(),
              ),
              isExpanded: true,
              borderRadius: BorderRadius.circular(borderRadius()),
              items: const [
                DropdownMenuItem(
                    value: "10 centimos", child: Text("10 centimos")),
                DropdownMenuItem(
                    value: "20 centimos", child: Text("20 centimos")),
                DropdownMenuItem(
                    value: "50 centimos", child: Text("50 centimos")),
              ],
              value: "10 centimos",
              onChanged: print,
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
