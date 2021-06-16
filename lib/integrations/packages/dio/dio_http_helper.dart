import 'package:dio/dio.dart';

import '../../helpers/http_helper.dart';

class DioHttpHelper implements HttpHelper {
  @override
  Future<HttpResponse> delete(String path) async {
    final Dio dio = await _buildDio();
    try {
      final Response<dynamic> response = await dio.delete<dynamic>(path);

      return _buildHttpResponse(response);
    } catch (e) {
      final HttpRequestError error = _getOrThrowExceptionByResponse(e);
      return _buildErrorHttpResponse(error);
    }
  }

  @override
  Future<HttpResponse> post(
    String path, {
    dynamic data,
  }) async {
    final Dio dio = await _buildDio();
    try {
      final Response<dynamic> response = await dio.post<dynamic>(
        path,
        data: data,
      );

      return _buildHttpResponse(response);
    } catch (e) {
      final HttpRequestError error = _getOrThrowExceptionByResponse(e);
      return _buildErrorHttpResponse(error);
    }
  }

  @override
  Future<HttpResponse> get(String url,
      {Duration? cacheTime, Map<String, dynamic>? queryParameters}) async {
    final Dio dio = await _buildDio();
    try {
      final Response<dynamic> response =
          await dio.get<dynamic>(url, queryParameters: queryParameters);

      return _buildHttpResponse(response);
    } catch (e) {
      final HttpRequestError error = _getOrThrowExceptionByResponse(e);
      return _buildErrorHttpResponse(error);
    }
  }

  HttpResponse _buildErrorHttpResponse(HttpRequestError error) {
    return HttpResponse(
      error.data,
      error.statusCode,
    );
  }

  HttpResponse _buildHttpResponse(Response<dynamic> response) {
    return HttpResponse(
      response.data,
      response.statusCode!,
    );
  }

  Future<Dio> _buildDio() async {
    final Dio dio = Dio();
    await _checkAuthorization(dio);
    return dio;
  }

  Future<void> _checkAuthorization(Dio dio) async {
    dio.options.headers['Authorization'] = 'token';
  }

  HttpRequestError _getOrThrowExceptionByResponse(Object e) {
    if (e is DioError && e.response != null) {
      return HttpRequestError(
          e.response?.statusCode ?? 500, e.response?.data, e);
    }
    throw e;
  }
}
