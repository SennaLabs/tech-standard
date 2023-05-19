import 'dart:developer';

import 'package:dio/dio.dart';

class ToolingDioInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('TOOLING REQUEST[${options.method}] => PATH: ${options.path}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('TOOLING RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError e, ErrorInterceptorHandler handler) async {
    inspect('[TOOLING] DioError e');
    inspect(e);
    print('TOOLING ERROR[${e.error}] => PATH: ${e.requestOptions.path}');
    return super.onError(e, handler);
  }
}
