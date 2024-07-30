import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio;

  ApiClient() : _dio = Dio() {
    final options = BaseOptions(
      baseUrl: 'https://nibrahim.pythonanywhere.com/',
    );
    _dio.options = options;
  }

  Future<Response> get(String path) async {
    return await _dio.get(path);
  }

  Future<Response> post(String path, dynamic data) async {
    return await _dio.post(path, data: data);
  }

  Future<Response> put(String path, dynamic data) async {
    return await _dio.put(path, data: data);
  }

  Future<Response> delete(String path) async {
    return await _dio.delete(path);
  }

  Future<Response> patch(String path, dynamic data) async {
    return await _dio.patch(path, data: data);
  }
}
