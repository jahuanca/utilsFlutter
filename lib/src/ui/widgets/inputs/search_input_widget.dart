import 'package:flutter/material.dart';
import 'package:utils/utils.dart';

class SearchInputWidget extends StatelessWidget {
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final bool isSearching;
  final void Function()? onClear;
  final String? textOfResults;
  final String hintText;
  final EdgeInsetsGeometry? padding;
  final IconData prefixIcon;
  final IconData suffixIcon;
  final FocusNode? focusNode;

  const SearchInputWidget({
    super.key,
    required this.hintText,
    this.onChanged,
    this.controller,
    this.isSearching = false,
    this.onClear,
    this.textOfResults,
    this.padding,
    this.prefixIcon = Icons.search,
    this.suffixIcon = Icons.close,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TapRegion(
            onTapOutside: (event) => focusNode?.unfocus(),
            child: TextFormField(
                onChanged: onChanged,
                controller: controller,
                decoration: InputDecoration(
                  hintText: hintText,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(borderRadius())),
                  prefixIcon: Icon(prefixIcon),
                  suffixIcon: ChildOrElseWidget(
                    condition: isSearching,
                    child: IconWidget(onTap: onClear, iconData: suffixIcon),
                  ),
                )),
          ),
          if (textOfResults != null)
            Text(
              textOfResults.orEmpty(),
              textAlign: TextAlign.start,
            ),
        ],
      ),
    );
  }
}
