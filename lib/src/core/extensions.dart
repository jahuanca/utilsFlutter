extension Double on double {
  String formatDecimals([int numberDecimals = numberDecimalsDefault]) =>
      toStringAsFixed(numberDecimals);
}

const int numberDecimalsDefault = 2;
