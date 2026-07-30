/// Estructura que retorna el metodo [validateText]

class ValidateResult<T> {
  /// `hasError` devuelve true o false en caso exista un error
  bool hasError;

  /// `error` contiene el mensaje de la [RuleValidator] que no fue cumplida.
  String? error;

  /// `value` en caso de no existir un error contiene el valor.
  T? value;

  String label;

  ValidateResult({
    required this.label,
    this.value,
    this.hasError = true,
    this.error = 'Este campo aún no ha sido validado.',
  });

  factory ValidateResult.initialize({
    required String label,
    required T? value,
  }) =>
      ValidateResult(
        label: label,
        hasError: false,
        error: null,
        value: value,
      );

  factory ValidateResult.pending({
    required String label,
    T? value,
  }) =>
      ValidateResult(
        label: label,
        hasError: false,
        error: '$label no ha sido validado.',
        value: value,
      );
}
