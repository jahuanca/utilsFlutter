

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class ChildOrElseWidget extends StatelessWidget {

  final Widget child;
  final bool condition;
  final Widget elseWidget;

  const ChildOrElseWidget({
    super.key,
    required this.condition,
    required this.child,
    this.elseWidget = const SizedBox(),
  });

  @override
  Widget build(BuildContext context) {
    return condition ? child : elseWidget;
  }
}