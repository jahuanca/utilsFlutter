import 'package:flutter/material.dart';

class DialogWidget extends StatelessWidget {

  final String title;
  final String message;
  final String okText;
  final String cancelText;

  const DialogWidget({
    super.key,
    required this.title,
    required this.message,
    required this.okText,
    required this.cancelText,
    });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(okText)),
        TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(cancelText))
      ],
      
    );
  }
}
