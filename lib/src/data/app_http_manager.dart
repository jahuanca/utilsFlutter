import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as https;
import 'package:utils/src/core/constants.dart';
import 'package:utils/src/data/app_exceptions.dart';
import 'package:utils/src/data/enum_auth.dart';
import 'package:utils/src/domain/http_manager.dart';
import 'package:utils/utils.dart';

const timeout = Duration(seconds: timeOutValue);

class AppHttpManager implements HttpManager {
  @override
  Future<AppResponseHttp> get({
    required String url,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
    bool replaceAllUrl = false,
  }) async {
    try {
      log('Api Get request url $url');
      log('Query: ${query.toString()}');
      final response = await https
          .get(
              Uri.parse(_queryBuilder(
                  path: url, query: query, replaceAllUrl: replaceAllUrl)),
              headers: await _headerBuilder(headers))
          .timeout(timeout, onTimeout: () => throw TimeoutException());
      return _returnResponse(response);
    } on SocketException catch (_) {
      throw NetworkException();
    }
  }

  @override
  Future<AppResponseHttp> post({
    required String url,
    required Map<String, dynamic> body,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
    bool showError = true,
    bool replaceAllUrl = false,
  }) async {
    try {
      log('Api Post request url $url, with $body');
      final response = await https.post(
          Uri.parse(_queryBuilder(
              path: url, query: query, replaceAllUrl: replaceAllUrl)),
          body: jsonEncode(body),
          headers: await _headerBuilder(headers))
          .timeout(timeout, onTimeout: () => throw TimeoutException())
          ;
      return _returnResponse(response);
    } on SocketException catch (_) {
      throw NetworkException();
    }
  }

  @override
  Future<AppResponseHttp> put({
    required String url,
    required Map<String, dynamic> body,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
    bool replaceAllUrl = false,
  }) async {
    try {
      log('Api Put request url $url, with $body');
      final response = await https
          .put(
              Uri.parse(_queryBuilder(
                  path: url, query: query, replaceAllUrl: replaceAllUrl)),
              body: json.encode(body),
              headers: await _headerBuilder(headers))
          .timeout(timeout, onTimeout: () => throw TimeoutException());
      return _returnResponse(response);
    } on SocketException catch (_) {
      throw NetworkException();
    }
  }

  @override
  Future<AppResponseHttp> delete({
    required String url,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
    bool replaceAllUrl = false,
  }) async {
    try {
      log('Api Delete request url $url');
      final response = await https
          .delete(
              Uri.parse(_queryBuilder(
                  path: url, query: query, replaceAllUrl: replaceAllUrl)),
              headers: await _headerBuilder(headers))
          .timeout(timeout, onTimeout: () => throw TimeoutException());
      return _returnResponse(response);
    } on SocketException catch (_) {
      throw NetworkException();
    }
  }

  Future<Map<String, String>> _headerBuilder(
      Map<String, String>? headersNew) async {
    Map<String, String> headers = <String, String>{};

    headers[HttpHeaders.acceptHeader] = 'application/json';
    headers[HttpHeaders.contentTypeHeader] = 'application/json';
    headers[HttpHeaders.connectionHeader] = 'Keep-Alive';

    EnumAuth auth = authentication();

    switch (auth) {
      case EnumAuth.all:
        _setBasicAuth(headers);
        _setTokenHeader(headers);
        break;
      case EnumAuth.onlyBasicAuth:
        _setBasicAuth(headers);
        break;
      case EnumAuth.onlyToken:
        _setTokenHeader(headers);
        break;
      case EnumAuth.none:
        break;
      default:
        break;
    }

    if (headersNew?.isNotEmpty ?? false) {
      headersNew?.forEach((key, value) {
        headers[key] = value;
      });
    }
    log('Headers');
    log(headers.toString());
    return headers;
  }

  void _setTokenHeader(Map<String, String> headers) async {
    String? token = UserPreferences().getToken();
    if (token != null) {
      headers[HttpHeaders.authorizationHeader] = token;
    }
  }

  void _setBasicAuth(Map<String, String> headers) async {
    String basicAuth = base64
        .encode(utf8.encode('${basicAuthUsername()}:${basicAuthPassword()}'));
    headers[HttpHeaders.authorizationHeader] = 'Basic $basicAuth';
  }

  String _queryBuilder({
    required String path,
    Map<String, dynamic>? query,
    bool replaceAllUrl = false,
  }) {
    final buffer = StringBuffer()
      ..write(replaceAllUrl ? path : '${urlServer()}$path');
    if (query != null) {
      if (query.isNotEmpty) {
        buffer.write('?');
      }
      query.forEach((key, value) {
        if (value != null) buffer.write('$key=$value&');
      });
    }
    log(buffer.toString());
    return buffer.toString();
  }

  AppResponseHttp _returnResponse(https.Response response) {
    final appResponseHttp = AppResponseHttp(
          body: response.body,
          statusCode: response.statusCode,
          headers: response.headers);
    _logResponse(appResponseHttp);
    return appResponseHttp;
  }

  void _logResponse(AppResponseHttp appResponseHttp) {
    bool isSuccessful = appResponseHttp.isSuccessful;
    int statusCode = appResponseHttp.statusCode;
    
    log('Api response ${isSuccessful ? 'Succes' : 'Error'} $statusCode with:');
    if (showLog()) {
      log(appResponseHttp.body);
    }
  }

  AppResponseHttp errorNetworkException(https.Response response) => AppResponseHttp(
      body: emptyString,
      statusCode: 500,
      headers: response.headers);
}
