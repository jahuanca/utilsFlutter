
class AppResponseHttp{

  String body;
  int statusCode;
  bool isSuccessful;
  Map<String, String> headers;

  AppResponseHttp({
    required this.body, 
    required this.statusCode, 
    required this.isSuccessful,
    required this.headers,
    });

}