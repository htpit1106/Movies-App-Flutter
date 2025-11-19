import 'package:dio/dio.dart';
import 'package:movies_app/network/api_client.dart';

class ApiUtil {
  static Dio getDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: "https://api.themoviedb.org",
        connectTimeout: Duration(milliseconds: 5000),
        receiveTimeout: Duration(milliseconds: 3000),
        // headers: {"accept": "application/json"},
      ),
    );

    return dio;
  }

  static ApiClient get apiClient {
    return ApiClient(getDio());
  }
}
