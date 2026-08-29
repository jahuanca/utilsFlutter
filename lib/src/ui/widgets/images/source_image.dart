
import 'dart:io';

import 'package:flutter/material.dart';

sealed class SourceImage {
  final String path;
  SourceImage(this.path);
}

class LocalSourceImage extends SourceImage {

  LocalSourceImage(super.path);
  ImageProvider get imageProvider => FileImage(File(path)) as ImageProvider;
}

class NetworkSourceImage extends SourceImage {

  NetworkSourceImage(super.path);
  ImageProvider get imageProvider => NetworkImage(path) as ImageProvider;
}

class AssetSourceImage extends SourceImage {

  AssetSourceImage(super.path);
  ImageProvider get imageProvider => AssetImage(path, package: 'utils') as ImageProvider;
}
