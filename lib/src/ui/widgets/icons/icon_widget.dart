import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {

  final IconData iconData;
  final void Function()? onTap;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final double? size;

  const IconWidget({ 
    required this.iconData,
    this.onTap,
    this.color,
    this.padding,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: GestureDetector(
        onTap: onTap,
        child: Icon(iconData, color: color, size: size,)
      ),
    );
  }
}