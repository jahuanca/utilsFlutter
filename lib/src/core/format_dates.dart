import 'package:intl/intl.dart';

extension DateFormats on DateTime? {
  String? formatDMMYYY() =>
      this == null ? null : DateFormat(onlyDateFormat, locale).format(this!);

  String? format({required String formatDate, String locale = locale}) =>
      this == null ? null : DateFormat(formatDate, locale).format(this!);
}

const String onlyDateFormat = 'dd/MM/y';
const String locale = 'es';
