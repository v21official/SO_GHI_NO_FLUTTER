import 'package:dio/dio.dart';

class EndpointProvider {
  late Dio _dio;

  Dio connectApi() {
    BaseOptions options =
        BaseOptions(receiveTimeout: 10000, connectTimeout: 10000);
    _dio = Dio(options);
    return _dio;
  }
}
