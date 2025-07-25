
import 'package:utils/src/core/default_extensions.dart';

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

  if (days < defaultInt) {
    months--;
    DateTime fechaAnteriorMes = DateTime(until.year, until.month - 1, from.day);
    days = until.day -
        from.day +
        _daysInMonth(fechaAnteriorMes.year, fechaAnteriorMes.month);
  }

  if (months < defaultInt) {
    years--;
    months += 12;
  }
  String finalString = emptyString;
  if (years > defaultInt) {
    finalString += '$years años, ';
  }
  if (months > defaultInt) {
    finalString += '$months meses, ';
  }
  if (days > defaultInt) {
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