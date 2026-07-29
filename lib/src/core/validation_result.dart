
/// Estructura que retorna el metodo [validateText]

class ValidateResult<T> {
  /// `hasError` devuelve true o false en caso exista un error
  bool hasError;

  /// `error` contiene el mensaje de la [RuleValidator] que no fue cumplida.
  String? error;

  /// `value` en caso de no existir un error contiene el valor.
  T? value;

  ValidateResult({
    this.hasError = true,
    this.error = 'Este campo aún no ha sido validado',
    required this.value,
  });

  factory ValidateResult.toInit(T value) => ValidateResult(
    hasError: false,
    value: value,
  );
}