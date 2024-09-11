import 'package:flutter/material.dart';
import 'package:utils/src/data/data_functions.dart';

class ImageActionWidget extends StatelessWidget {
  final double height;
  final double width;
  final String? urlImage;
  final IconData? iconData;
  final Color? iconBackground;
  final Color? iconColor;
  final EdgeInsetsGeometry padding;
  final BoxShape shape;
  final void Function()? onTapIcon;
  final Color borderColor;

  const ImageActionWidget({
    super.key,
    required this.height,
    required this.width,
    this.padding = const EdgeInsets.all(0),
    this.shape = BoxShape.circle,
    this.urlImage,
    this.iconData,
    this.iconColor,
    this.iconBackground,
    this.onTapIcon,
    this.borderColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    bool isCircle = shape == BoxShape.circle;

    return Padding(
      padding: padding,
      child: SizedBox(
        height: height,
        width: width,
        child: Stack(
          children: [
            (isCircle) ? circleImage() : rectangularImage(),
            if (iconData != null)
              GestureDetector(
                onTap: onTapIcon,
                child: Container(
                  padding: isCircle
                      ? EdgeInsets.only(left: height * 0.5)
                      : EdgeInsets.only(
                          right: width * 0.05, bottom: height * 0.05),
                  alignment:
                      isCircle ? Alignment.bottomCenter : Alignment.bottomRight,
                  child: CircleAvatar(
                    backgroundColor: iconBackground ?? primaryColor(),
                    child: Icon(
                      color: iconColor ?? cardColor(),
                      Icons.add),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget circleImage() {
    return Center(
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: borderColor),
            shape: BoxShape.circle),
        child: CircleAvatar(
          backgroundImage: (urlImage != null)
              ? NetworkImage(
                  urlImage!,
                ) as ImageProvider
              : const AssetImage('assets/images/image_not_found.jpg'),
        ),
      ),
    );
  }

  Widget rectangularImage() {
    return Container(
      color: borderColor,
      width: width,
      height: height,
      child: Image(
          image: (urlImage != null)
              ? NetworkImage(
                  urlImage!,
                ) as ImageProvider
              : const AssetImage('assets/images/image_not_found.jpg')),
    );
  }
}
