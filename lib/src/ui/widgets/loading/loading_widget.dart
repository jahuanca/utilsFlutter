
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {

  final bool show;
  const LoadingWidget({
    super.key,
    required this.show,
    });

  @override
  Widget build(BuildContext context) {
    return show 
      ? Container(
        color: Colors.black12,
        alignment: Alignment.center,
        child: const CircularProgressIndicator(),
      ) 
      : Container();
  }
}