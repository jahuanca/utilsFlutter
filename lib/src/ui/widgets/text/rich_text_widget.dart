import 'package:flutter/material.dart';
import 'package:utils/src/ui/widgets/text/rich_text_item.dart';

class RichTextWidget extends StatelessWidget {

  final String mainText;
  final TextStyle? mainStyle;
  final List<RichTextItem> items;
  final TextAlign align;

  RichTextWidget({
    super.key,
    required this.mainText,
    this.mainStyle,
    this.items = const [],
    this.align = TextAlign.start,
    });

  @override
  Widget build(BuildContext context) {

    final style = mainStyle ?? TextStyle();

    final children = items.map(
      (e) => TextSpan(
        text: e.text,
        style: e.style,
      ),
    ).toList();

    return RichText(
      textAlign: align,
      text: TextSpan(
        text: mainText,
        style: style,
        children: children,
      ),
    );
  }
}