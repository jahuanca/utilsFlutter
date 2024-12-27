import 'package:utils/utils.dart';

extension Double on double {
  String formatDecimals([int numberDecimals = numberDecimalsDefault]) =>
      (this - truncate() != 0) ? toStringAsFixed(numberDecimals) : toStringAsFixed(defaultInt);
}

const int numberDecimalsDefault = 2;
