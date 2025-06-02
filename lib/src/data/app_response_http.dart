
class AppResponseHttp{

  String body;
  int statusCode;
  bool isSuccessful;
  Map<String, String> headers;
  String title;
  String detail;

  AppResponseHttp({
    required this.body, 
    required this.statusCode, 
    required this.isSuccessful,
    required this.headers,
    required this.title,
    required this.detail,
    });

}