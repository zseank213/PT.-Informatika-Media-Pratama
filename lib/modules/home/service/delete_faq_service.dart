import 'package:dio/dio.dart';
import 'package:ptinformatikamediapratama/lib.dart';

class DeleteFAQService {
  final Dio _dio = Dio();

  DeleteFAQService() {
    _dio.interceptors.add(Logging());
  }

  Future<Response> delete({required DeleteFAQParram data}) async {
    Map<String, dynamic> headers = {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": "Bearer ${await SecureStorage.getAccessToken()}",
    };

    _dio.options.baseUrl = baseUrl;

    var response = await _dio.delete(
      "$apiFAQ/${data.id}",
      options: Options(
        headers: headers,
        validateStatus: (_) => true,
      ),
    );
    return response;
  }
}
