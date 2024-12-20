import 'package:intl/intl.dart';

extension DateFormats on DateTime? {
  String? formatDMMYYY() =>
      this == null ? null : DateFormat(onlyDateFormat).format(this!);

  String? format(String formatDate) =>
      this == null ? null : DateFormat(formatDate).format(this!);
}

const String onlyDateFormat = 'd/M/y';
