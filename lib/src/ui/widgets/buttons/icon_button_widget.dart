import 'package:flutter/material.dart';
import 'package:utils/src/core/constants.dart';
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

    final border = _getBorder;

    return Padding(
      padding: padding,
      child: Container(
        width: width ?? circleAvatarHeight,
        height: height ?? circleAvatarWidth,
        decoration: BoxDecoration(
            color: backgroundColor ?? primaryColor(),
            shape: shape,
            borderRadius: isCircle ? null : borderRadius,
            border: border),
        child: IconButton(
            onPressed: onPressed,
            icon: Icon(
              iconData,
              color: iconColor ?? secondaryColor(),
            )),
      ),
    );
  }

  Border? get _getBorder {
    if(borderColor == null) return null;
    return Border.all(
      color: borderColor!,
    );
  }
}
