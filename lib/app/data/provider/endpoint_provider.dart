import 'package:dio/dio.dart';
import 'package:monitorflutter/app/exception/logging_interceptor.dart';

class EndpointProvider{
  late Dio _dio;

  Dio connectApi() {
    BaseOptions options =
    BaseOptions(receiveTimeout: 10000, connectTimeout: 10000);
    _dio = Dio(options);
    _dio.interceptors.add(LoggingInterceptor());
    return _dio;
  }
}