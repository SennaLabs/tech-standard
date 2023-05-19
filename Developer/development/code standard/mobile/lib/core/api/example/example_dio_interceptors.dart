import 'dart:developer';

import 'package:dio/dio.dart';

class ExampleDioInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('EXAMPLE REQUEST[${options.method}] => PATH: ${options.path}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('EXAMPLE RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError e, ErrorInterceptorHandler handler) async {
    inspect('[EXAMPLE] DioError e');
    inspect(e);
    print('EXAMPLE ERROR[${e.error}] => PATH: ${e.requestOptions.path}');
    return super.onError(e, handler);
  }
}
