
import 'package:flutter/material.dart';
import 'package:utils/src/core/text_styles.dart';
import 'package:utils/src/data/data_functions.dart';

AppBar appBarWidget({
  required String text, 
  bool hasArrowBack = false, 
  bool centerTitle = true,
  double? elevation = 1,
  TextStyle? titleTextStyle,
  List<Widget>? actions = const [],
  Widget? leading,
  Color? backgroundColor,
  Color? shadowColor,
  }){
  return AppBar(
    shadowColor: shadowColor ?? cardColor(),
    elevation: elevation,
    backgroundColor: backgroundColor ?? cardColor(),
    automaticallyImplyLeading: hasArrowBack,
    leading: leading,
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    centerTitle: true,
    title: Text(text),
    actions: actions,
    titleTextStyle: titleTextStyle ?? titleTextAppBarStyleBase(),
  );
}