import 'package:flutter/material.dart';
import 'package:utils/src/data/config/network_config.dart';
import 'package:utils/src/data/config/theme_config.dart';

class DataConfig {

  InputBorder? inputBorder;
  Widget Function(Widget)? wrapperWidgetInputs;
  NetworkConfig? networkConfig;
  ThemeConfig? themeConfig;

  DataConfig({
    this.inputBorder,
    this.wrapperWidgetInputs,
    this.networkConfig,
    this.themeConfig,
  }) {
    themeConfig ??= ThemeConfig();
  }

  factory DataConfig.fromJson(Map<String, dynamic> json) => DataConfig(
        inputBorder: json["inputBorder"],
        wrapperWidgetInputs: json["wrapperWidgetInputs"],
        networkConfig: json['networkConfig'] == null ? null : NetworkConfig.fromJson(json['networkConfig']),
      );

  Map<String, dynamic> toJson() => {
        "inputBorder": inputBorder,
        "wrapperWidgetInputs": wrapperWidgetInputs,
        'networkConfig': networkConfig?.toJson(),
      };
}
