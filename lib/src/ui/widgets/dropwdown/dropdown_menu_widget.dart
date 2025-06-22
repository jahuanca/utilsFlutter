import 'package:flutter/material.dart';
import 'package:utils/src/core/default_no_exports.dart';
import 'package:utils/src/ui/utils/strings.dart';
import 'package:utils/src/ui/widgets/utils.dart';
import 'package:utils/utils.dart';

class DropdownMenuWidget extends StatelessWidget {
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
  final dynamic initialValue;
  final String hintText;
  final IconData? iconData;
  final Color? iconEnabledColor;
  final Color? iconDisabledColor;
  final String idLabel;
  final String idValue;
  final bool isAlignLabel;
  final Widget Function(Widget)? wrapperWidget;
  final TextEditingController? controller;
  final double? menuHeight;
  final FocusNode focusNode = FocusNode();

  DropdownMenuWidget({
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
    this.initialValue,
    this.iconData,
    this.iconEnabledColor,
    this.iconDisabledColor,
    this.idLabel = defaultLabelValue,
    this.idValue = defaultIdValue,
    this.wrapperWidget,
    this.isAlignLabel = false,
    this.controller,
    this.menuHeight,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double heightInput = size.height * dimensionInput();
    final InputBorder inputBorderSelected = inputBorderCurrent ?? inputBorder();
    final double heigthPadding = heightInput * 0.1;
    final Widget Function(Widget)? wrapperSelected =
        wrapperWidgetInputs() ?? wrapperWidget;
    final InputDecoration inputDecoration = inputDecorationWidget(
      error: error,
      inputBorderSelected: inputBorderSelected,
      heigthPadding: heigthPadding,
    );

    Widget content = Container(
      padding: padding,
      child: Column(
        children: [
          labelWidget(
            size: size,
            label: label,
            textStyleLabel: textStyleLabel,
            heigthPadding: isAlignLabel ? (heigthPadding * 2) : defaultDouble,
          ),
          TapRegion(
            onTapOutside: (event) => focusNode.unfocus(),
            child: Container(
              height: heightWidget(size: size),
              child: DropdownMenu<dynamic>(
                leadingIcon: iconData == null ? null : Icon(iconData),
                //style: primaryTextStyleBase(),
                inputDecorationTheme: InputDecorationTheme(
                  contentPadding: inputDecoration.contentPadding,
                  // filled: inputDecoration.filled.orFalse(),
                  counterStyle: inputDecoration.counterStyle,
                  hintStyle: inputDecoration.hintStyle,
                  enabledBorder: inputDecoration.enabledBorder,
                  border: inputDecoration.border,
                  focusedBorder: inputDecoration.focusedBorder,
                  
                ),
                menuHeight: menuHeight ?? (size.height * 0.5),
                //filterCallback: (entries, filter) => ,
                controller: controller,
                initialSelection: initialValue,
                width: size.width,
                enableFilter: true,
                hintText: hintText,
                onSelected: onChanged,
                requestFocusOnTap: true,
                dropdownMenuEntries: items == null
                    ? []
                    : items!.map(
                        (e) {
                          switch (e.runtimeType) {
                            case String:
                              return DropdownMenuEntry(
                                value: e,
                                label: e,
                              );
            
                            default:
                              if (e is Map) {
                                return DropdownMenuEntry(
                                  value: e[idValue],
                                  label: e[idLabel],
                                );
                              }
                              return DropdownMenuEntry(
                                value: e.toJson()[idValue],
                                label: e.toJson()[idLabel],
                              );
                          }
                        },
                      ).toList(),
              ),
            ),
          ),
          if (showError) errorContainerWidget(error: error),
        ],
      ),
    );

    if (wrapperSelected == null) {
      return content;
    } else {
      return wrapperSelected(content);
    }
  }
}


//  TODO: pasar todos los estilos e iconos personalizados, 
//  retirar variables que no aplican
//  renombrar variables en uso