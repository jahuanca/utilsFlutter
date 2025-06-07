import 'package:utils/src/data/enum_error.dart';

class AppResponseHttp {
  String body;
  int statusCode;
  Map<String, String> headers;

  AppResponseHttp({
    required this.body,
    required this.statusCode,
    required this.headers,
  });

  bool get isSuccessful => (statusCode >= 200 && statusCode <= 299);

  String get title => _currentResponse.title;
  String get detail => _currentResponse.detail;

  EnumResponse get _currentResponse {
    if (isSuccessful) {
      return EnumResponse.okResponse;
    }
    return EnumResponse.values.firstWhere(
      (e) => e.statusCode == statusCode,
      orElse: () => EnumResponse.defaultErrorResponse,
    );
  }
}
