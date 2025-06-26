import 'package:flutter/material.dart';
import 'package:utils/src/core/colors.dart';
import 'package:utils/src/core/durations.dart';

enum TypeSnackbar {
  
  success(
    title: 'Éxito',
    backgroundColor: successColorBase,
    colorText: Colors.white,
  ),
  error(
    title: 'Error',
    backgroundColor: dangerColorBase,
    colorText: Colors.white,
  ),
  warning(
    title: 'Advertencia',
    backgroundColor: alertColorBase,
    colorText: Colors.white,
  ),
  info(
    title: 'Info',
    backgroundColor: infoColorBase,
    colorText: Colors.white,
  );

  const TypeSnackbar({
    required this.title,
    required this.backgroundColor,
    required this.colorText,
    this.duration = oneSecondDuration,
  });

  final String title;
  final Color? backgroundColor;
  final Color colorText;
  final Duration duration;

}
