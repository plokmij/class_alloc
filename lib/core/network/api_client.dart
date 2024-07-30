import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio;

  ApiClient() : _dio = Dio() {
    final options = BaseOptions(
      baseUrl: 'https://nibrahim.pythonanywhere.com/',
    );
    _dio.options = options;
  }
}
