
const _statusCodeKey = 'statusCode';
const _titleKey = 'title';
const _errorMessageKey = 'errorMessage';

class ErrorEntity{
  int statusCode;
  String title;
  String errorMessage;

  ErrorEntity({
    required this.statusCode,
    required this.title,
    required this.errorMessage,
  });

  Map<String, dynamic> toJson() => {
    _statusCodeKey: statusCode,
    _titleKey: title,
    _errorMessageKey: errorMessage,
  };

  factory ErrorEntity.fromJson(Map<String, dynamic> json) => ErrorEntity(
    statusCode: json[_statusCodeKey], 
    title: json[_titleKey], 
    errorMessage: json[_errorMessageKey],
  );
}