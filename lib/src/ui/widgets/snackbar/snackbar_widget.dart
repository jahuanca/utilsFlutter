
import 'package:flutter/material.dart';
import 'package:utils/src/core/type_snackbar.dart';

class SnackbarWidget extends StatelessWidget {

  final String message;
  final TypeSnackbar typeSnackbar;

  const SnackbarWidget({
    super.key,
    required this.message,
    required this.typeSnackbar,
    });

  @override
  Widget build(BuildContext context) {
    return SnackBar(
    content: Text(message),
    backgroundColor: typeSnackbar.backgroundColor,
    elevation: 10,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(5),
  );
  }
}