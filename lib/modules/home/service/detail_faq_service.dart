import 'package:dio/dio.dart';
import 'package:ptinformatikamediapratama/lib.dart';

class DetailFAQService {
  final Dio _dio = Dio();

  DetailFAQService() {
    _dio.interceptors.add(Logging());
  }

  Future<Response> get({required DetailFAQParram data}) async {
    Map<String, dynamic> headers = {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": "Bearer ${await SecureStorage.getAccessToken()}",
    };

    _dio.options.baseUrl = baseUrl;

    var response = await _dio.get(
      "$apiFAQ/${data.id}",
      options: Options(
        headers: headers,
        validateStatus: (_) => true,
      ),
    );
    return response;
  }
}
