import 'package:intl/intl.dart';

extension DateFormats on DateTime? {
  String? getOnlyDates() =>
      this == null ? null : DateFormat(onlyDateFormat).format(this!);
}

const String onlyDateFormat = 'd/mm/yyyy';
