import 'package:dio/dio.dart';
import 'package:ptinformatikamediapratama/lib.dart';

class ListFAQService {
  final Dio _dio = Dio();

  ListFAQService() {
    _dio.interceptors.add(Logging());
  }

  Future<Response> get({required ListFAQParram data}) async {
    Map<String, dynamic> headers = {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": "Bearer ${await SecureStorage.getAccessToken()}",
    };

    _dio.options.baseUrl = baseUrl;

    var response = await _dio.get(
      apiFAQ,
      queryParameters: {
        "page": data.page,
        "rows": data.row,
      },
      options: Options(
        headers: headers,
        validateStatus: (_) => true,
      ),
    );
    return response;
  }
}
