import 'package:intl/intl.dart';

extension DateFormats on DateTime? {
  String? formatDMMYYY() =>
      this == null ? null : DateFormat(onlyDateFormat).format(this!);
}

const String onlyDateFormat = 'd/M/y';
