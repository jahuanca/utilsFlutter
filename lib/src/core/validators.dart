import 'default_extensions.dart';

/// Estructura que retorna el metodo [validateText]

class ValidateResult {
  /// `hasError` devuelve true o false en caso exista un error
  bool hasError;

  /// `error` contiene el mensaje de la [RuleValidator] que no fue cumplida.
  String? error;

  /// `value` en caso de no existir un error contiene el valor.
  dynamic value;

  ValidateResult({
    required this.hasError,
    required this.error,
    required this.value,
  });
}

enum RuleValidator {
  isRequired,
  isInt,
  isDouble,
  isDatetime,
  minLength,
  maxLength,
  minValue,
  maxValue,
}

enum ToConverter {
  toStr,
  toInt,
  toDouble,
  toDatetime,
}

ValidateResult validateText({
  required dynamic text,
  required String label,
  Map<RuleValidator, dynamic> rules = const {},
  ToConverter? toConvert,
}) {
  if (rules.isEmpty) {
    return ValidateResult(error: null, hasError: false, value: text);
  }

  for (var i = 0; i < rules.values.length; i++) {
    RuleValidator rule = rules.keys.elementAt(i);

    dynamic value = rules.values.elementAt(i);
    switch (rule) {
      case RuleValidator.isRequired:
        if (text == null) {
          return ValidateResult(
            error: '$label es necesario',
            hasError: true,
            value: null,
          );
        }
        if (text is String && value == true) {
          if ([null, emptyString, 'null'].contains(text)) {
            return ValidateResult(
              error: '$label es necesario',
              hasError: true,
              value: null,
            );
          }
        }

        if (text is num) {
          if ([null, 0].contains(text) && value == true) {
            return ValidateResult(
              error: '$label es necesario',
              hasError: true,
              value: null,
            );
          }
        }

        if (text is DateTime) {
          if ([null].contains(text) && value == true) {
            return ValidateResult(
              error: '$label es necesario',
              hasError: true,
              value: null,
            );
          }
        }
        break;

      case RuleValidator.minLength:
        if ([null].contains(text)) break;
        if ((text as String).length < (value as int)) {
          return ValidateResult(
            error: 'Dimensión mínima: $value',
            hasError: true,
            value: null,
          );
        }
        break;

      case RuleValidator.maxLength:
        if ((text as String).length > (value as int)) {
          return ValidateResult(
            error: 'Dimensión máxima: $value',
            hasError: true,
            value: null,
          );
        }
        break;

      case RuleValidator.isInt:
        if (int.tryParse(text) == null && value == true) {
          return ValidateResult(
            error: '$label debe ser entero',
            hasError: true,
            value: null,
          );
        }
        break;

      case RuleValidator.isDouble:
        if (text is! double) {
          if (text is String) {
            if (double.tryParse(text) == null && value == true) {
              return ValidateResult(
                error: '$label debe ser decimal',
                hasError: true,
                value: null,
              );
            }
          } else {
            return ValidateResult(
              error: '$label debe ser una fecha',
              hasError: true,
              value: null,
            );
          }
        }
        break;

      case RuleValidator.isDatetime:
        if (text is! DateTime) {
          if (text is String) {
            if (DateTime.tryParse(text) == null && value == true) {
              return ValidateResult(
                error: '$label debe ser una fecha',
                hasError: true,
                value: null,
              );
            }
          } else {
            return ValidateResult(
              error: '$label debe ser una fecha',
              hasError: true,
              value: null,
            );
          }
        }
        break;

      case RuleValidator.minValue:
        final errorToReturn = ValidateResult(
          error: '$label no debe ser menor a $value',
          hasError: true,
          value: null,
        );
        if (value is num) {
          if (text < value) return errorToReturn;
        } else {
          if (num.tryParse(text) != null && num.tryParse(text)! < value) {
            return errorToReturn;
          }
        }
        break;

      case RuleValidator.maxValue:
        final errorToReturn = ValidateResult(
          error: '$label no debe ser mayor a $value',
          hasError: true,
          value: null,
        );
        if (value is num) {
          if (text > value) return errorToReturn;
        } else {
          if (num.tryParse(text) != null && num.tryParse(text)! > value) {
            return errorToReturn;
          }
        }
        break;
      default:
        break;
    }
  }
  if (toConvert != null) {
    switch (toConvert) {
      case ToConverter.toInt:
        if (text is! int) text = int.tryParse(text);
        break;
      case ToConverter.toDouble:
        if (text is! double) text = double.tryParse(text);
        break;
      case ToConverter.toStr:
        if (text is! String) text = text.toString();
        break;
      case ToConverter.toDatetime:
        if (text is! DateTime) text = DateTime.tryParse(text);
        break;
    }
    if (text == null) {
      ValidateResult(
          error: 'No se pudo convertir $label.', hasError: true, value: null);
    }
  }
  return ValidateResult(error: null, hasError: false, value: text);
}

ValidateResult? findErrorInValidations(List<ValidateResult?> validations) {
  return validations.firstWhere(
    (e) => e!.hasError.orFalse(),
    orElse: () => null,
  );
}
