import 'package:flutter/material.dart';
import 'package:utils/src/core/type_snackbar.dart';

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
    elevation: 10,
    duration: duration ?? const Duration(milliseconds: 1000),
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(5),
  ));
}