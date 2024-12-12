extension EmptyString on String? {
  String orEmpty() => this ?? '';
}

extension EmptyInt on int? {
  int orZero() => this ?? 0;
}

extension EmptyList on List<dynamic>? {
  List<dynamic> orEmpty() => this ?? [];
}

extension NullBool on bool?{
  bool orFalse() => this ?? false;
}

const String emptyString = '';
const int notFoundPosition = -1;
const int firstElementPosition = 0;
const int defaultInt = 0;
const double defaultDouble = 0.0;
