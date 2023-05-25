import 'package:dio/dio.dart';
import 'package:ptinformatikamediapratama/lib.dart';

class AddFAQService {
  final Dio _dio = Dio();

  AddFAQService() {
    _dio.interceptors.add(Logging());
  }

  Future<Response> post({required AddFAQParram data}) async {
    Map<String, dynamic> headers = {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": "Bearer ${await SecureStorage.getAccessToken()}",
    };

    _dio.options.baseUrl = baseUrl;

    var response = await _dio.post(
      apiFAQ,
      data: {
        "pertanyaan": data.pertanyaan,
        "jawaban": data.jawaban,
        "status_publish": data.status_publish,
      },
      options: Options(
        headers: headers,
        validateStatus: (_) => true,
      ),
    );
    return response;
  }
}
