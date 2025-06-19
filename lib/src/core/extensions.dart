import 'dart:math';
import 'package:utils/utils.dart';

extension Double on double {
  String formatDecimals([int numberDecimals = numberDecimalsDefault]) =>
      (this - truncate() != 0) ? toStringAsFixed(numberDecimals) : toStringAsFixed(defaultInt);
  
  String truncateAndFormatDecimals([int numberDecimals = numberDecimalsDefault]) {
    num mod = pow(10.0, numberDecimals);
    double value = ((this * mod).round().toDouble() / mod);
    return (value - truncate() != 0) 
      ? value.toStringAsFixed(numberDecimals) 
      : value.toStringAsFixed(defaultInt);
  }
}

extension StringExtensions on String {
  
  String capitalize() => "${this[0].toUpperCase()}${substring(1)}";
}

const int numberDecimalsDefault = 2;
