import 'package:flutter/material.dart';
import 'package:utils/src/core/default_extensions.dart';
import 'package:utils/src/data/data_functions.dart';
import 'package:utils/src/ui/widgets/utils.dart';

class CheckBoxWidget extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final Color? checkBoxColor;
  final bool? isChecked;
  final void Function(bool?)? onChanged;
  final String? label;
  final TextStyle? textStyleLabel;
  final String? error;
  final bool showError;
  final Widget Function(Widget)? wrapperWidget;
  final Decoration? decorationCurrent;

  const CheckBoxWidget({
    required this.title,
    this.subtitle,
    this.padding,
    this.backgroundColor,
    this.checkBoxColor,
    this.isChecked = false,
    this.onChanged,
    this.label,
    this.textStyleLabel,
    this.showError = false,
    this.error,
    this.wrapperWidget,
    this.decorationCurrent,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // final decorationSelected = decorationCurrent ?? boxDecorationWidget(error: error, backgroundColor: backgroundColor);
    final Widget Function(Widget)? wrapperSelected = wrapperWidgetInputs() ?? wrapperWidget;

    final content = Container(
      padding: padding,
      child: Column(
        children: [
          labelWidget(size: size, label: label, textStyleLabel: textStyleLabel),
          Container(
            height: heightWidget(size: size),
            decoration: decorationCurrent,
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
