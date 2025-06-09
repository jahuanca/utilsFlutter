import 'package:flutter/material.dart';
import 'package:utils/src/core/default_extensions.dart';

Future<bool> showDialogWidget({
  required BuildContext context,
  required String message,
  String? title = 'Alerta',
  String? okText = 'Aceptar',
  String? cancelText = 'Cancelar',
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
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text(cancelText.orEmpty())),
              TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text(okText.orEmpty())),
            ],
          )).then((bool? value) => value.orFalse(),);
}
