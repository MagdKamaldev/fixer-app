part of 'login_cubit.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final String message;

  LoginSuccess(this.message);
}

final class LoginFailed extends LoginState {
  final String message;

  LoginFailed(this.message);
}

class GoogleSignUpLoading extends LoginState {}

class GoogleSignUpSuccess extends LoginState {}

class GoogleSignUpFailure extends LoginState {
  final String message;
  GoogleSignUpFailure(this.message);
}
