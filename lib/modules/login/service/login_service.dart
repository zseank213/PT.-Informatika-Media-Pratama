import 'package:dio/dio.dart';
import 'package:ptinformatikamediapratama/lib.dart';

class LoginService {
  final Dio _dio = Dio();

  LoginService() {
    _dio.interceptors.add(Logging());
  }

  Map<String, dynamic> headers = {
    "Accept": "application/json",
    "Content-Type": "application/x-www-form-urlencoded",
    // "Authorization": "Bearer ${await SecureStorage.getAccessToken()}",
  };

  Future<Response> post({required LoginParram data}) async {
    _dio.options.baseUrl = baseUrl;

    var response = await _dio.post(
      apiLogin,
      data: {
        "nip": data.nip,
        "password": data.password,
      },
      options: Options(
        headers: headers,
        validateStatus: (_) => true,
      ),
    );
    return response;
  }
}
