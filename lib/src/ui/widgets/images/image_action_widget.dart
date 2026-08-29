import 'package:flutter/material.dart';
import 'package:utils/src/core/ui_component.dart';
import 'package:utils/src/ui/widgets/images/source_image.dart';
import 'package:utils/utils.dart';

/// Preview:
/// ![ImageActionWidget](https://cdn-icons-png.flaticon.com/512/3135/3135715.png)
@UiComponent(
  description: 'Image Action Widget',
  preview: 'assets/previews/test.png',
)

// ignore: must_be_immutable
class ImageActionWidget extends StatelessWidget {
  final double height;
  final double width;
  SourceImage? sourceImage;
  final String? label;
  final IconData? iconData;
  final Color? iconBackground;
  final Color? iconColor;
  final EdgeInsetsGeometry padding;
  final BoxShape shape;
  final void Function()? onTap;
  final void Function()? onTapIcon;
  final Color borderColor;

  ImageActionWidget({
    super.key,
    required this.height,
    required this.width,
    this.padding = noPadding,
    this.shape = BoxShape.circle,
    this.sourceImage,
    this.iconData,
    this.iconColor,
    this.iconBackground,
    this.onTapIcon,
    this.onTap,
    this.label,
    this.borderColor = Colors.transparent,
  }) {
    sourceImage ??= AssetSourceImage('assets/images/image_not_found.png');
  }

  @override
  Widget build(BuildContext context) {
    bool isCircle = shape == BoxShape.circle;

    return Padding(
      padding: padding,
      child: Column(
        children: [
          ChildOrElseWidget(
            condition: (label != null),
            child: Text(
              label.orEmpty(),
              style: labelStyle(),
            ),
          ),
          SizedBox(
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
                      alignment: isCircle
                          ? Alignment.bottomCenter
                          : Alignment.bottomRight,
                      child: CircleAvatar(
                        backgroundColor: iconBackground ?? primaryColor(),
                        child: Icon(color: iconColor ?? cardColor(), Icons.add),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget circleImage() {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: borderColor),
              shape: BoxShape.circle),
          child: CircleAvatar(
            backgroundImage: (sourceImage != null)
                ? _returnImage(sourceImage!)
                : const AssetImage('assets/images/image_not_found.png',
                    package: 'utils'),
          ),
        ),
      ),
    );
  }

  Widget rectangularImage() {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: borderColor,
        width: width,
        height: height,
        child: Image(
            image: (sourceImage != null)
                ? _returnImage(sourceImage!)
                : const AssetImage('assets/images/image_not_found.png',
                    package: 'utils')),
      ),
    );
  }

  ImageProvider _returnImage(SourceImage source) {
    switch (source) {
      case NetworkSourceImage():
        return source.imageProvider;
      case AssetSourceImage():
        return source.imageProvider;
      case LocalSourceImage():
        return source.imageProvider;
    }
  }
}