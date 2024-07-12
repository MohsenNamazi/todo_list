import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_list/data/network/dio/dio_request.dart';

typedef RequestMockData = ({
  String path,
  RequestMethod method,
  Map<String, dynamic>? queryParameters,
  Map<String, dynamic> response,
});

class DioMock extends Mock implements Dio {
  Dio mockData<T>(
    String path,
    String baseUrl,
    T response, {
    Map<String, dynamic>? queryParameters,
    int statusCode = 200,
  }) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        queryParameters: queryParameters,
      ),
    );
    final adapter = DioAdapter(
      dio: dio,
      matcher: const UrlRequestMatcher(),
    )..onGet(path, (server) {
        server.reply(statusCode, response);
      });
    dio.httpClientAdapter = adapter;

    return dio;
  }

  Dio mockError(String path, String baseUrl, DioException exception) {
    final dio = Dio(
      BaseOptions(baseUrl: baseUrl),
    );
    final adapter = DioAdapter(
      dio: dio,
      matcher: const UrlRequestMatcher(),
    )..onGet(path, (server) {
        server.reply(400, exception);
      });
    dio.httpClientAdapter = adapter;

    return dio;
  }
}
