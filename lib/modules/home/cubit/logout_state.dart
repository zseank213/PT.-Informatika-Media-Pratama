part of 'logout_cubit.dart';

abstract class LogoutState {}

class LogoutInitial extends LogoutState {}

class OnLoadingLogout extends LogoutState {}

class OnErrorLogout extends LogoutState {
  OnErrorLogout();
}

class OnSuccessLogout extends LogoutState {
  OnSuccessLogout();
}
