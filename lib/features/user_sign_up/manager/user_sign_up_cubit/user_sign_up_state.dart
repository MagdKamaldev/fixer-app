part of 'user_sign_up_cubit.dart';
sealed class UserSignUpState {}

final class UserSignUpInitial extends UserSignUpState {}

final class UserSignUpLoading extends UserSignUpState {}

final class UserSignUpSuccess extends UserSignUpState {
  final UserModel user;
  UserSignUpSuccess(this.user);
}

final class UserSignUpFailure extends UserSignUpState {
  final String message;
  UserSignUpFailure(this.message);
}

final class GoogleSignUpLoading extends UserSignUpState {} 

final class GoogleSignUpSuccess extends UserSignUpState {
  final AuthCredential credential;
  GoogleSignUpSuccess(this.credential);
}

final class GoogleSignUpFailure extends UserSignUpState {
  final String message;
  GoogleSignUpFailure(this.message);
}

final class ChangePageState extends UserSignUpState {}