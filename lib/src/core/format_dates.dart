import 'package:intl/intl.dart';
import 'package:utils/src/core/date_functions.dart';
import 'package:utils/src/core/default_extensions.dart';

extension DateFormats on DateTime? {
  String? formatDMMYYY() =>
      this == null ? null : DateFormat(onlyDateFormat, locale).format(this!);

  String? format({required String formatDate, String locale = locale}) =>
      this == null ? null : DateFormat(formatDate, locale).format(this!);

  String timeFromDate({DateTime? startDate}) {
    DateTime untilDate = startDate ?? defaultDate;
    return differenceTime(from: this, until: untilDate);
  }
}

const String onlyDateFormat = 'dd/MM/y';
const String locale = 'es';
