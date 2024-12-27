import 'package:utils/src/core/default_extensions.dart';

class ValidateResult {
  String? error;
  bool hasError;
  String? value;

  ValidateResult({
    required this.error,
    required this.hasError,
    required this.value,
  });
}

enum RuleValidator {
  isRequired,
  isInt,
  isDouble,
  minLength,
  maxLength,
  minValue,
  maxValue,
}

String? validatorText(
    {required dynamic text,
    required String label,
    Map<RuleValidator, dynamic> rules = const {}}) {
  String? error;
  if (rules.isEmpty) return error;

  for (var i = 0; i < rules.values.length; i++) {
    RuleValidator rule = rules.keys.elementAt(i);

    dynamic value = rules.values.elementAt(i);
    switch (rule) {
      case RuleValidator.isRequired:
        if (text is String && value == true) {
          if ([null, '', 'null'].contains(text)) {
            return '$label es necesario';
          }
        }

        if (text is num) {
          if ([null, 0].contains(text) && value == true) {
            return '$label es necesario';
          }
        }
        break;

      case RuleValidator.minLength:
        if ([null].contains(text)) break;
        if ((text as String).length < (value as int)) {
          return 'Dimensión mínima: $value';
        }
        break;

      case RuleValidator.maxLength:
        if ((text as String).length > (value as int)) {
          return 'Dimensión máxima: $value';
        }
        break;

      case RuleValidator.isInt:
        if (int.tryParse(text) == null && value == true) {
          return '$label debe ser entero';
        }
        break;

      case RuleValidator.isDouble:
        if (double.tryParse(text) == null && value == true) {
          return '$label debe ser decimal';
        }
        break;

      case RuleValidator.minValue:
        if (num.tryParse(text) != null && num.tryParse(text)! < value) {
          return '$label no debe ser menor a $value';
        }
        break;

      case RuleValidator.maxValue:
        if (num.tryParse(text) != null && num.tryParse(text)! > value) {
          return '$label no debe ser mayor a $value';
        }
        break;

      default:
        break;
    }
  }
  return error;
}

ValidateResult validateText(
    {required dynamic text,
    required String label,
    Map<RuleValidator, dynamic> rules = const {}}) {
  if (rules.isEmpty) {
    return ValidateResult(error: null, hasError: false, value: text);
  }

  for (var i = 0; i < rules.values.length; i++) {
    RuleValidator rule = rules.keys.elementAt(i);

    dynamic value = rules.values.elementAt(i);
    switch (rule) {
      case RuleValidator.isRequired:
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
        if (double.tryParse(text) == null && value == true) {
          return ValidateResult(
            error: '$label debe ser decimal',
            hasError: true,
            value: null,
          );
        }
        break;

      case RuleValidator.minValue:
        if (num.tryParse(text) != null && num.tryParse(text)! < value) {
          return ValidateResult(
            error: '$label no debe ser menor a $value',
            hasError: true,
            value: null,
          );
        }
        break;

      case RuleValidator.maxValue:
        if (num.tryParse(text) != null && num.tryParse(text)! > value) {
          return ValidateResult(
            error: '$label no debe ser mayor a $value',
            hasError: true,
            value: null,
          );
        }
        break;

      default:
        break;
    }
  }
  return ValidateResult(error: null, hasError: false, value: text);
}
