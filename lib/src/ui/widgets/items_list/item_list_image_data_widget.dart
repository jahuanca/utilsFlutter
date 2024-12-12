import 'package:flutter/material.dart';
import 'package:utils/src/core/extensions.dart';
import 'package:utils/src/core/storage_type.dart';
import 'package:utils/src/data/data_functions.dart';
import 'package:utils/src/ui/utils/paddings.dart';

const EdgeInsets _defaultPaddingContent = EdgeInsets.all(20);

class ItemListImageDataWidget extends StatelessWidget {
  final EdgeInsetsGeometry paddingImage;
  final EdgeInsetsGeometry paddingContent;
  final BoxShape shape;
  final BoxFit fitImage;
  final double? width;
  final double? height;
  final String path;
  final StorageType storageType;
  final String title;
  final String? subtitle;
  final String? detail;
  final EdgeInsetsGeometry? paddingAll;
  final Decoration? decorationAll;
  final double cardElevation;

  const ItemListImageDataWidget({
    this.decorationAll,
    this.paddingAll,
    this.paddingImage = defaultPadding,
    this.paddingContent = _defaultPaddingContent,
    this.shape = BoxShape.circle,
    this.fitImage = BoxFit.contain,
    required this.width,
    required this.height,
    required this.path,
    this.storageType = StorageType.remoteStorage,
    required this.title,
    this.subtitle,
    this.detail,
    this.cardElevation = defaultDouble,
  });

  @override
  Widget build(BuildContext context) {
    final bool isCircle = (shape == BoxShape.circle);

    final imageProvider = (storageType == StorageType.remoteStorage)
        ? NetworkImage(
            path,
          )
        : AssetImage(path) as ImageProvider;

    return Container(
      padding: paddingAll,
      child: Material(
        elevation: cardElevation,
        borderRadius: cardElevation != defaultDouble ? BorderRadius.circular(borderRadius()) : null,
        child: Container(
          decoration: decorationAll,
          width: width,
          height: height,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Padding(
                  padding: paddingImage,
                  child: FittedBox(
                    fit: fitImage,
                    child: isCircle
                        ? CircleAvatar(backgroundImage: imageProvider)
                        : Image(image: imageProvider),
                  ),
                ),
              ),
              Expanded(
                  flex: 3,
                  child: Container(
                    padding: paddingContent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(title),
                        if (subtitle != null) Text(subtitle.orEmpty()),
                        if (detail != null) Text(detail.orEmpty())
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
