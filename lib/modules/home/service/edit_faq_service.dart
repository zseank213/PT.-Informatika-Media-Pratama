import 'package:dio/dio.dart';
import 'package:ptinformatikamediapratama/lib.dart';

class EditFAQService {
  final Dio _dio = Dio();

  EditFAQService() {
    _dio.interceptors.add(Logging());
  }

  Future<Response> post({required EditFAQParram data}) async {
    Map<String, dynamic> headers = {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": "Bearer ${await SecureStorage.getAccessToken()}",
    };

    _dio.options.baseUrl = baseUrl;

    var response = await _dio.post(
      "$apiFAQ/${data.id}",
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
