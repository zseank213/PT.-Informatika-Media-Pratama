import 'package:dio/dio.dart';
import 'package:ptinformatikamediapratama/lib.dart';
 
class LogoutService {
  final Dio _dio = Dio();

  LogoutService() {
    _dio.interceptors.add(Logging());
  }

  Future<Response> post() async {
    Map<String, dynamic> headers = {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": "Bearer ${await SecureStorage.getAccessToken()}",
    };

    _dio.options.baseUrl = baseUrl;

    var response = await _dio.post(
      apiLogout,
      options: Options(
        headers: headers,
        validateStatus: (_) => true,
      ),
    );
    return response;
  }
}
