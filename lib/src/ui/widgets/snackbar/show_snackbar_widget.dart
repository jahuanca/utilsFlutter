import 'package:flutter/material.dart';
import 'package:utils/src/core/type_snackbar.dart';
import 'package:utils/src/ui/widgets/snackbar/snackbar_widget.dart';

Future<void> showSnackbarWidget(
    {required BuildContext context,
    required TypeSnackbar typeSnackbar,
    String? title,
    required String message,
    int? duration}) async {
  ScaffoldMessenger.of(context).showSnackBar(SnackbarWidget(
    message: message,
    typeSnackbar: typeSnackbar,
  ) as SnackBar);
}
