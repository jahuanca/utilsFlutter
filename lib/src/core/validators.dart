enum RuleValidator {
  required,
  minLength,
  maxLength,
  isInt,
  isDouble,
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

      case RuleValidator.required:
        if (text is String) {
          if ([null, '', 'null'].contains(text)) {
            return '$label es un valor necesario';
          }
        }

        if (text is num) {
          if ([null, 0].contains(text)) {
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

      default:
        break;
    }
    if (error != null) return error;
  }
  return error;
}
