import 'package:flutter/material.dart';
import 'package:utils/src/ui/utils/strings.dart';

class EmptyWidget extends StatelessWidget {

  final String? title;
  final String? description;
  final EdgeInsets? padding;
  final IconData iconData;
  final double iconSize;
  final Color? iconColor;

  EmptyWidget({
    super.key,
    this.title,
    this.description,
    this.padding,
    this.iconData = Icons.hourglass_empty,
    this.iconSize = 60,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    final TextStyle titleStyle = TextStyle(
      fontWeight: FontWeight.w500,
    );

    EdgeInsets defaultPadding = EdgeInsets.symmetric(
      horizontal: size.width * 0.1,
    );

    return Container(
      padding: padding ?? defaultPadding,
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconData, size: iconSize, color: iconColor,),
          SizedBox(height: 5,),
          Text(title ?? titleOfEmptyWidgetString, style: titleStyle,),
          SizedBox(height: 10,),
          Text(description ?? descriptionOfEmptyWidgetString, textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}
