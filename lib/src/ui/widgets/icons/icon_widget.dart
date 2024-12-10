import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {

  final IconData iconData;
  final void Function()? onTap;
  final Color? color;
  final EdgeInsetsGeometry? padding;

  const IconWidget({ 
    required this.iconData,
    this.onTap,
    this.color,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: GestureDetector(
        onTap: onTap,
        child: Icon(iconData, color: color,)
      ),
    );
  }
}