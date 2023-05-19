import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'example/example_dio_interceptors.dart';
import 'tooling/tooling_dio_interceptors.dart';

class DioService {
  late Dio exampleClientService;
  late Dio toolingClientService;

  static final DioService _dioService = DioService._internal();

  factory DioService() {
    return _dioService;
  }

  DioService._internal() {
    final exampleClientDioOptions = BaseOptions(
      baseUrl: dotenv.env['EXAMPLE_API']!,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    exampleClientService = Dio(exampleClientDioOptions);

    final toolingClientDioOptions = BaseOptions(
      baseUrl: dotenv.env['TOOLING_API']!,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );

    toolingClientService = Dio(toolingClientDioOptions);

    exampleClientService.interceptors.add(ExampleDioInterceptors());
    toolingClientService.interceptors.add(ToolingDioInterceptors());
  }
}
