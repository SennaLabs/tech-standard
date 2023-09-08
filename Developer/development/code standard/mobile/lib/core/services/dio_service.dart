import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../api/example/example_dio_interceptors.dart';
import '../api/tooling/tooling_dio_interceptors.dart';

class DioService {
  late Dio exampleClientService;
  late Dio toolingClientService;

  static final DioService _dioService = DioService._internal();
  static DioService get instance => _dioService;

  factory DioService() {
    return _dioService;
  }

  DioService._internal() {
    final exampleClientDioOptions = BaseOptions(
      baseUrl: dotenv.env['EXAMPLE_API']!,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    );
    exampleClientService = Dio(exampleClientDioOptions);

    final toolingClientDioOptions = BaseOptions(
      baseUrl: dotenv.env['TOOLING_API']!,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    );

    toolingClientService = Dio(toolingClientDioOptions);

    exampleClientService.interceptors.add(ExampleDioInterceptors());
    toolingClientService.interceptors.add(ToolingDioInterceptors());
  }
}
