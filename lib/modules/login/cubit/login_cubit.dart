import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptinformatikamediapratama/lib.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final LoginService _LoginService = LoginService();

  void post({required LoginParram data}) async {
    emit(OnLoadingGetAuthLogin());

    var res = await _LoginService.post(data: data);

    if (res.statusCode == 200) {
      var _data = LoginModel.fromJson(res.data);
      debugPrint('Get Auth Status : Success');
      emit(OnSuccessGetAuthLogin(data: _data));
      await SharedPrefsStorage.setUserProfile(data: res.data);
      await SecureStorage.setAccessToken(token: _data.data?.accessToken ?? "");
    } else {
      var _data = LoginModel.fromJson(res.data);

      debugPrint('Get Auth Status: ${res.toString()}');

      emit(OnErrorGetAuthLogin(errorMessage: _data.message?.error));
    }
  }
}
