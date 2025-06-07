
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:utils/src/data/data_functions.dart';

// ignore: must_be_immutable
class TagWidget extends StatelessWidget {

  final String title;
  final IconData? icon;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? paddingContent;
  final void Function()? onTap;
  final double sizeIcon;
  final MainAxisAlignment alignmentOfContent;
  Color? backgroundColor;
  Color? borderColor;
  Color? textColorAndIcon;

  TagWidget({
    super.key,
    required this.title,
    this.icon,
    this.backgroundColor,
    this.borderColor,
    this.textColorAndIcon,
    this.padding,
    this.paddingContent = const EdgeInsets.all(5.0),
    this.onTap,
    this.sizeIcon = 20,
    this.alignmentOfContent = MainAxisAlignment.start,
  }){
    backgroundColor ??= primaryColor();
    borderColor ??= primaryColor();
    textColorAndIcon ??= primaryTextColor();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(borderRadius())),
          padding: paddingContent,
          child: Row(
            mainAxisAlignment: alignmentOfContent,
            children: [
              if(icon != null)
              Icon(icon, color: textColorAndIcon, size: sizeIcon,),
              const SizedBox(width: 5,),
              Text(title, style: TextStyle(
                color: textColorAndIcon,
              ),),
            ],
          ),
        ),
      ),
    );
  }
}