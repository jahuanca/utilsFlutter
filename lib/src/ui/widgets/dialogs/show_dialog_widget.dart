
import 'package:flutter/material.dart';
import 'package:utils/src/ui/widgets/dialogs/dialog_widget.dart';

Future<dynamic> showDialogWidget({
  required BuildContext context,
  required String message,
  String? title,
  String? okText,
  String? cancelText,
  bool isDismissible = false,
}){
  return showDialog(
    context: context, 
    barrierDismissible: isDismissible,
    builder: (context) => DialogWidget(
      title: title ?? 'Alerta',
      message: message,
      okText: okText ?? 'Aceptar',
      cancelText: cancelText ?? 'Cancelar',
      
    ),);
}