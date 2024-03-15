import 'package:dio/dio.dart';

class DioClient {
  Dio get dio => _getDio();

  Dio _getDio() {
    BaseOptions options = BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );
    Dio dio = Dio(options);
    dio.interceptors.add(LogInterceptor());

    return dio;
  }
}
