extension Double on double {
  String formatDecimals([int numberDecimals = numberDecimalsDefault]) =>
      toString().contains('.') ? toStringAsFixed(numberDecimals) : toString();
}

const int numberDecimalsDefault = 2;
