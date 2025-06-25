import 'package:flutter/services.dart';
import 'package:utils/src/core/default_extensions.dart';

Map<T, List<S>> groupBy<S, T>(
    {required Iterable<S> values, required T Function(S) functionKey}) {
  Map<T, List<S>> map = <T, List<S>>{};
  for (S element in values) {
    (map[functionKey(element)] ??= []).add(element);
  }
  return map;
}

Future<void> copyToClipboard(String data) => Clipboard.setData(
  ClipboardData(text: data)
);

String differenceTime({
  required DateTime? from,
  required DateTime until,
}) {
  if (from == null || until.isAfter(from).not()) {
    return 'Error fecha incorrecta';
  }

  int years = until.year - from.year;
  int months = until.month - from.month;
  int days = until.day - from.day;

  if (days < 0) {
    months--;
    DateTime fechaAnteriorMes = DateTime(until.year, until.month - 1, from.day);
    days = until.day -
        from.day +
        _daysInMonth(fechaAnteriorMes.year, fechaAnteriorMes.month);
  }

  if (months < 0) {
    years--;
    months += 12;
  }
  String finalString = emptyString;
  if (years > 0) {
    finalString += '$years años, ';
  }
  if (months > 0) {
    finalString += '$months meses, ';
  }
  if (days > 0) {
    finalString += '$days días';
  }
  return finalString;
}

int _daysInMonth(int year, int month) {
  if (month == DateTime.february) {
    bool isLeapYear = (year % 4 == 0) && (year % 100 != 0 || year % 400 == 0);
    return isLeapYear ? 29 : 28;
  }
  const List<int> daysInMonths = [
    31,
    -1,
    31,
    30,
    31,
    30,
    31,
    31,
    30,
    31,
    30,
    31
  ];
  return daysInMonths[month - 1];
}
