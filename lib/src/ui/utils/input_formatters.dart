import 'package:flutter/services.dart';

final FilteringTextInputFormatter inputFormatterDouble =
    FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d*)'));
final FilteringTextInputFormatter inputFormatterPhoneNumber =
    FilteringTextInputFormatter.allow(RegExp(r'(^\d{9}$)'));
final FilteringTextInputFormatter inputFormatterEmail =
    FilteringTextInputFormatter.allow(RegExp(r'\S+@\S+\.\S+'));
