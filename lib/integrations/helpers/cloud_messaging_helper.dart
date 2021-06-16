abstract class CloudMessagingHelper {
  Future<HttpResponse> post(
    String path, {
    dynamic data,
  });

  Future<HttpResponse> delete(String path);

  Future<HttpResponse> get(String url, {Duration cacheTime});
}

class HttpResponse {
  HttpResponse(
    this.data,
    this.statusCode,
  );

  final dynamic data;
  final int statusCode;

  bool isOk() {
    return statusCode == 200;
  }
}

class HttpRequestError implements Exception {
  const HttpRequestError(
    this.statusCode,
    this.data,
    this.stackTrace,
  );
  final int statusCode;
  final dynamic data;
  final Exception stackTrace;

  @override
  String toString() =>
      'HttpRequestError: statusCode -> $statusCode, data -> $data';
}
