import 'package:flutter/material.dart';
import 'package:utils/utils.dart';

// ignore: must_be_immutable
class BottomNavigationBarWidget extends StatelessWidget {
  final List<BottomNavigationItemWidget> icons;
  final bool showTitles;
  final double sizeSelected;
  final double sizeUnselected;
  final void Function(int index) onTapItem;
  final int indexSelectedItem;
  Color? colorSelected;
  Color? colorUnselected;
  Color? backgroundColor;

  BottomNavigationBarWidget({
    super.key,
    required this.icons,
    required this.onTapItem,
    required this.indexSelectedItem,
    this.showTitles = true,
    this.backgroundColor,
    this.sizeSelected = kBottomNavigationBarHeight / 2,
    this.sizeUnselected = kBottomNavigationBarHeight / 2.6,
    this.colorSelected,
    this.colorUnselected,
  }) {
    backgroundColor ??= cardColor();
    colorSelected ??= primaryColor();
    colorUnselected ??= Colors.black12;
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgets = [];

    for (int i = 0; i < icons.length; i++) {
      final isSelected = i == indexSelectedItem;
      final BottomNavigationItemWidget e = icons[i];
      widgets.add(
        Expanded(
            child: GestureDetector(
          onTap: () => onTapItem(i),
          child: Container(
            color: backgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(
                  e.icon,
                  color: isSelected ? colorSelected : colorUnselected,
                  size: isSelected ? sizeSelected : sizeUnselected,
                ),
                if (showTitles) Text(e.title)
              ],
            ),
          ),
        )),
      );
    }

    return Container(
      height: kBottomNavigationBarHeight,
      color: backgroundColor,
      child: Row(
        children: widgets,
      ),
    );
  }
}
