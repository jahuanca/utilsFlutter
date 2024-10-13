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
    {
      required dynamic text,
      required String label,
      Map<RuleValidator, dynamic> rules = const {}  
    }) {

  String? error;
  if (rules.isEmpty) return error;

  for (var i = 0; i < rules.values.length; i++) {
    
    RuleValidator rule = rules.keys.elementAt(i);

    dynamic value = rules.values.elementAt(i);
    switch (rule) {

      case RuleValidator.isRequired:
        if (text is String && value == true) {
          if ([null, '', 'null'].contains(text)) {
            return '$label es un valor necesario';
          }
        }

        if (text is num) {
          if ([null, 0].contains(text) && value == true) {
            return '$label es un valor necesario';
          }
        }
        break;

      case RuleValidator.minLength:
        if ([null].contains(text)) break;
        if ((text as String).length < (value as int)) {
          return 'Dimensión minima $value';
        }
        break;

      case RuleValidator.maxLength:
        if ((text as String).length > (value as int)) {
          return 'Dimensión máxima $value';
        }
        break;

      case RuleValidator.isInt:
        if(int.tryParse(text) == null && value == true ){
          return '$label debe ser un entero';
        }
        break;

      case RuleValidator.isDouble:
        if(double.tryParse(text) == null && value == true ){
          return '$label debe ser un decimal';
        }
        break;

      case RuleValidator.minValue:
        if(num.tryParse(text) != null && num.tryParse(text)! < value ){
          return '$label no debe ser menor a $value';
        }
        break;

      case RuleValidator.maxValue:
        if(num.tryParse(text) != null && num.tryParse(text)! > value ){
          return '$label no debe ser mayor a $value';
        }
        break;
      default:
        break;
    }
    if (error != null) return error;
  }
  return error;
}
