import 'package:flutter/material.dart';
import 'package:utils/src/core/type_snackbar.dart';


const double _defaultElevation = 10;
Future<void> showSnackbarWidget(
    {
      required BuildContext context,
      required TypeSnackbar typeSnackbar,
      String? title,
      required String message,
      Duration? duration
    }) async {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    backgroundColor: typeSnackbar.backgroundColor,
    elevation: _defaultElevation,
    duration: duration ?? const Duration(milliseconds: 1000),
    behavior: SnackBarBehavior.fixed,
  ));
}