import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '/app/core/models/logged_user_po.dart';

class Interceptors implements InterceptorsWrapper {
  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    debugPrint('ERROR[${err.error}}] => PATH: ${err.requestOptions.path}');
    return handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('REQUEST[${options.method}] => PATH: ${options.path}');
    if (LoggedUserPO.logeedUser?.token?.acessToken != null) {
      options.headers.addAll({
        'Authorization': 'Bearer ${LoggedUserPO.logeedUser?.token?.acessToken}'
      });
    }
    return handler.next(options);
  }

  @override
  void onResponse(dynamic response, ResponseInterceptorHandler handler) {
    debugPrint(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    return handler.next(response);
  }
}
