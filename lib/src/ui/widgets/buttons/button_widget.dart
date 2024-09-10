
import 'package:flutter/material.dart';
import 'package:utils/src/core/text_styles.dart';
import 'package:utils/src/data/data_functions.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final IconData? icon;
  final void Function()? onTap;
  final EdgeInsetsGeometry padding;

  ButtonWidget({
    required this.text,
    this.icon,
    this.onTap,
    this.padding = const EdgeInsets.all(0)
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: padding,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: size.height * dimensionInput(),
          width: size.width,
          decoration: BoxDecoration(
              color: primaryColor(),
              border: Border.all(color: primaryColor()),
              borderRadius: BorderRadius.circular(borderRadius())),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if (icon != null)
                Expanded(
                    child: Container(
                      child: Icon(
                        icon,
                        color: botonStyle().color,
                      ),
                    ),
                    flex: 1),
              Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(text, style: botonStyle()),
                  ),
                  flex: 2),
              if (icon != null)
                Expanded(
                    child: Container(), flex: 1,),
            ],
          ),
        ),
      ),
    );
  }
}
