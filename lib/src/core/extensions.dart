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
