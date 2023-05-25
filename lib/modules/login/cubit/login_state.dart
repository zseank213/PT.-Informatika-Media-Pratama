part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class OnLoadingGetAuthLogin extends LoginState {}

class OnErrorGetAuthLogin extends LoginState {
  final String? errorMessage;

  OnErrorGetAuthLogin({this.errorMessage});
}

class OnSuccessGetAuthLogin extends LoginState {
  final LoginModel? data;

  //
  OnSuccessGetAuthLogin({this.data});
}
