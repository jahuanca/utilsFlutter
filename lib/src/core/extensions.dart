import 'package:utils/utils.dart';

extension Double on double {
  String formatDecimals([int numberDecimals = numberDecimalsDefault]) =>
      (this - truncate() != 0) ? toStringAsFixed(numberDecimals) : toStringAsFixed(defaultInt);
}

extension StringExtensions on String {
  
  String capitalize() => "${this[0].toUpperCase()}${substring(1)}";
}

const int numberDecimalsDefault = 2;
