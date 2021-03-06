import 'package:dio/dio.dart';
import 'http_client_exception.dart';

abstract class HttpClient {
  final Dio _dio;
  final String route;

  HttpClient(
      {required this.route,
      required String endPoint,
      Map<String, Object>? headers})
      : _dio = Dio(BaseOptions(
            baseUrl: endPoint,
            headers: headers,
            connectTimeout: 5000,
            contentType: 'application/json'));

  Future<dynamic> get({Map<String, Object>? query}) async {
    try {
      final Response response = await _dio.get(route, queryParameters: query);
      return response;
    } on DioError catch (error) {
      throw HttpClientException(error: error);
    }
  }

  Future<dynamic> post(
      {Map<String, Object>? query, Map<String, Object?>? map}) async {
    try {
      final Response response =
          await _dio.post(route, data: map, queryParameters: query);
      return response;
    } on DioError catch (error) {
      throw HttpClientException(error: error);
    }
  }

  Future<dynamic> delete(
      {Map<String, Object>? query, Map<String, Object?>? map}) async {
    try {
      final Response response =
          await _dio.put(route, data: map, queryParameters: query);
      return response;
    } on DioError catch (error) {
      throw HttpClientException(error: error);
    }
  }

  Future<dynamic> path(
      {Map<String, Object>? query, Map<String, Object?>? map}) async {
    try {
      final Response response =
          await _dio.patch(route, data: map, queryParameters: query);
      return response;
    } on DioError catch (error) {
      throw HttpClientException(error: error);
    }
  }

  Future<dynamic> put(
      {Map<String, Object>? query, Map<String, Object?>? map}) async {
    try {
      final Response response =
          await _dio.put(route, data: map, queryParameters: query);
      return response;
    } on DioError catch (error) {
      throw HttpClientException(error: error);
    }
  }
}
