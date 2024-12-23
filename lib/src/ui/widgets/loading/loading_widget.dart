
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {

  final bool show;
  final Color? color;
  const LoadingWidget({
    super.key,
    required this.show,
    this.color = Colors.black38,
    });

  @override
  Widget build(BuildContext context) {
    return show 
      ? Container(
        color: color,
        alignment: Alignment.center,
        child: const CircularProgressIndicator(),
      ) 
      : Container();
  }
}