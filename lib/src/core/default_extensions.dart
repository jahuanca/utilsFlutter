extension EmptyString on String? {
  String orEmpty() => this ?? '';
}

extension EmptyInt on int? {
  int orZero() => this ?? defaultInt;
}

extension EmptyDouble on double? {
  double orZero() => this ?? defaultDouble;
}

extension EmptyList on List<dynamic>? {
  List<dynamic> orEmpty() => this ?? [];
}

extension EmptyDate on DateTime? {
  DateTime orNow() => this ?? DateTime.now();
}

extension NullBool on bool?{

  /// En caso de que el booleano sea nulo retorna false
  ///
  /// @return El valor o si es nulo falso.
  bool orFalse() => this ?? false;

  bool not([bool? value]) => (this == null) ? (value ?? false) : !(this!);
}

const String emptyString = '';
const int notFoundPosition = -1;
const int firstElementPosition = 0;
const int defaultInt = 0;
const double defaultDouble = 0.0;


final DateTime defaultDate = DateTime.now();
