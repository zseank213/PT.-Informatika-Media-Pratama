import 'package:dio/dio.dart';
import 'package:ptinformatikamediapratama/lib.dart';

var loggingInterceptor = getLoggingInterceptor();
var errorInterceptor = getErrorInterceptor(loggingInterceptor);
var responseInterceptor = getResponseInterceptor(loggingInterceptor);
var requestInterceptor = getRequestInterceptor(loggingInterceptor);

class Logging extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    await requestInterceptor.getRequestInterceptor(requestOptions: options);
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    responseInterceptor.getResponseInterceptor(response: response);
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError dioError, ErrorInterceptorHandler handler) {
    errorInterceptor.getErrorInterceptors(dioError: dioError);
    return super.onError(dioError, handler);
  }
}
