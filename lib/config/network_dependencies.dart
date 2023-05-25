import 'package:dio/dio.dart';
import 'package:ptinformatikamediapratama/lib.dart';

/// Logging Interceptor
LoggingInterceptor getLoggingInterceptor() {
  return LoggingInterceptor();
}

/// Error Interceptors
ErrorInterceptor getErrorInterceptor(LoggingInterceptor loggingInterceptor) {
  return ErrorInterceptor(loggingInterceptor);
}

/// Response Interceptors
ResponseInterceptor getResponseInterceptor(LoggingInterceptor loggingInterceptor) {
  return ResponseInterceptor(loggingInterceptor);
}

/// Request Interceptors
RequestInterceptor getRequestInterceptor(LoggingInterceptor loggingInterceptor) {
  return RequestInterceptor(loggingInterceptor);
}

dioCatchError(e) {
  if (e.response != null) {
    return e.response;
  } else if (e.type == DioErrorType.connectTimeout) {
    return null;
  } else if (e.type == DioErrorType.receiveTimeout) {
    return null;
  } else {
    return null;
  }
}
