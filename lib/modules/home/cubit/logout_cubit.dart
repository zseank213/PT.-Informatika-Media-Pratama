import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptinformatikamediapratama/lib.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());

  final LogoutService _LogoutService = LogoutService();

  void post() async {
    emit(OnLoadingLogout());

    var res = await _LogoutService.post();

    if (res.statusCode == 200) {
      debugPrint('Get Auth Status : Success');

      emit(OnSuccessLogout());
      await SharedPrefsStorage.clearUserProfile();
      await SecureStorage.deleteAccessToken();
    } else {
      debugPrint('Get Auth Status: ${res.toString()}');
      emit(OnErrorLogout());
    }
  }
}
