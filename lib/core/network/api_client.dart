import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiClient {
  final Dio _dio;

  ApiClient() : _dio = Dio() {
    final options = BaseOptions(
      baseUrl: 'https://nibrahim.pythonanywhere.com/',
    );
    _dio.options = options;
    _dio.interceptors.add(
      QueryParamInterceptor(
        paramKey: 'api_key',
        paramValue: dotenv.env['VAR_NAME']!,
      ),
    );
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

class QueryParamInterceptor extends Interceptor {
  final String paramKey;
  final String paramValue;

  QueryParamInterceptor({required this.paramKey, required this.paramValue});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters[paramKey] = paramValue;
    return handler.next(options);
  }
}
