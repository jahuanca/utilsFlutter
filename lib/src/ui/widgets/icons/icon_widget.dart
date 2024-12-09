import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {

  final IconData iconData;
  final void Function()? onTap;
  final Color? color;
  const IconWidget({ 
    required this.iconData,
    this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(iconData, color: color,)
      );
  }
}