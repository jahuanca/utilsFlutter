

import 'package:utils/src/data/app_response_http.dart';
import 'package:utils/src/data/result.dart';

abstract class HttpManager {
  Future<Result<AppResponseHttp>> get({
    required String url,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
  });

  Future<Result<AppResponseHttp>> post({
    required String url,
    required Map<String, dynamic> body,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
  });

  Future<Result<AppResponseHttp>> put({
    required String url,
    required Map<String, dynamic> body,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
  });

  Future<Result<AppResponseHttp>> delete({
    required String url,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
  });
}
