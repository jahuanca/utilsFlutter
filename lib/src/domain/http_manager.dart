

import 'package:utils/src/data/app_response_http.dart';

abstract class HttpManager {
  Future<AppResponseHttp> get({
    required String url,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
  });

  Future<AppResponseHttp> post({
    required String url,
    required Map body,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
  });

  Future<AppResponseHttp> put({
    required String url,
    required Map body,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
  });

  Future<AppResponseHttp> delete({
    required String url,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
  });
}
