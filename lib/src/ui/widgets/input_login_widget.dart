
import 'package:flutter/material.dart';
import 'package:utils/src/core/text_styles.dart';
import 'package:utils/src/data/data_functions.dart';

class InputLoginWidget extends StatelessWidget {
  final String text;
  final IconData? icon;
  final bool enabled;
  final int maxLength;
  final TextInputType textInputType;
  final bool isObscure;
  final String? error;
  final String initialValue;
  final TextEditingController? textEditingController;
  final bool isTextArea;
  final void Function(String)? onChanged;

  InputLoginWidget({
    required this.text,
    required this.icon,
    this.enabled = true,
    this.maxLength = 50,
    this.textInputType = TextInputType.name,
    this.isObscure = false,
    this.initialValue = '',
    this.textEditingController,
    this.isTextArea = false,
    this.onChanged,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * dimensionInput(),
      width: size.width,
      decoration: BoxDecoration(
          color: cardColor(),
          border: Border.all(
              color: error != null
                  ? dangerColor()
                  : primaryColor()),
          borderRadius: BorderRadius.circular(borderRadius())),
      child: Stack(
        
        children: [
          Container(
            child: Row(
              children: [
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(borderRadius())),
                    child: Center(child: CircleAvatar(child: Icon(icon))),
                  ),
                  flex: 1,
                ),
                Flexible(flex: 4, child: Container()),
              ],
            ),
          ),
          Container(
            color: Colors.transparent,
            child: Row(
              children: [
                Flexible(
                    flex: 4,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(borderRadius())),
                      child: TextFormField(
                        enabled: enabled,
                        initialValue: initialValue,
                        maxLength: maxLength,
                        keyboardType: textInputType,
                        obscureText: isObscure,
                        maxLines: isTextArea ? 5 : 1,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal:
                                  (icon != null) ? size.width * 0.13 : 0),
                          filled: true,
                          fillColor: Colors.transparent,
                          counterText: '',
                          counterStyle: TextStyle(fontSize: 0),
                          hintText: text,
                          hintStyle: hintLoginStyle(),
                        ),
                        controller: textEditingController,
                        onChanged: onChanged,
                        textAlign:
                            isTextArea ? TextAlign.left : TextAlign.center,
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
