part of 'user_sign_up_cubit.dart';

sealed class UserSignUpState {}

class UserSignUpInitial extends UserSignUpState {}

class UserSignUpLoading extends UserSignUpState {}

class UserSignUpSuccess extends UserSignUpState {
  final UserModel user;
  UserSignUpSuccess(this.user);
}

class UserSignUpFailure extends UserSignUpState {
  final String message;
  UserSignUpFailure(this.message);
}

class GoogleSignUpLoading extends UserSignUpState {}

class GoogleSignUpSuccess extends UserSignUpState {
  final AuthCredential credential;
  GoogleSignUpSuccess(this.credential);
}

class GoogleSignUpFailure extends UserSignUpState {
  final String message;
  GoogleSignUpFailure(this.message);
}

class ChangePageState extends UserSignUpState {}

class SetLocationLocading extends UserSignUpState {}

class SetLocationSuccess extends UserSignUpState {
  final LocationModel location;
  SetLocationSuccess(this.location);
}

class SetLocationFailure extends UserSignUpState {
  final String message;
  SetLocationFailure(this.message);
}
