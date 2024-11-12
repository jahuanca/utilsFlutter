extension EmptyString on String? {
  String orEmpty() => this ?? '';
}

extension EmptyInt on int? {
  int orZero() => this ?? 0;
}