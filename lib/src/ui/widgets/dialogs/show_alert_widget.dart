import 'package:flutter/material.dart';
import 'package:utils/src/core/default_extensions.dart';

Future<bool?> showAlertWidget({
  required BuildContext context,
  required String message,
  String? title = 'Alerta',
  String? okText = 'Aceptar',
  bool isDismissible = false,
}) {
  return showDialog<bool>(
      context: context,
      barrierDismissible: isDismissible,
      builder: (context) => AlertDialog(
        title: Text(title.orEmpty()),
        content: Text(message),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(okText.orEmpty())),
        ],
      ));
}
