import 'package:flutter/material.dart';
import 'package:utils/utils.dart';

class IconButtonWidget extends StatelessWidget {
  final IconData iconData;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? borderColor;
  final void Function()? onPressed;
  final EdgeInsetsGeometry padding;
  final BorderRadiusGeometry? borderRadius;
  final BoxShape shape;

  const IconButtonWidget({
    required this.iconData,
    this.width,
    this.height,
    this.backgroundColor,
    this.iconColor,
    this.borderColor,
    this.onPressed,
    this.padding = noPadding,
    this.borderRadius,
    this.shape = BoxShape.circle,
  });

  @override
  Widget build(BuildContext context) {

    final bool isCircle = (shape == BoxShape.circle);

    return Padding(
      padding: padding,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: backgroundColor ?? primaryColor(),
            shape: shape,
            borderRadius: isCircle ? null : borderRadius,
            border: Border.all(
              color: borderColor ?? primaryColor(),
            )),
        child: IconButton(
            onPressed: onPressed,
            icon: Icon(
              iconData,
              color: iconColor ?? secondaryColor(),
            )),
      ),
    );
  }
}
