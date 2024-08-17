part of 'phone_auth_cubit.dart';

sealed class PhoneAuthState {}

final class PhoneAuthInitial extends PhoneAuthState {}

final class PhoneAuthLoading extends PhoneAuthState {}

final class PhoneAuthFailure extends PhoneAuthState {
  final String message;
  PhoneAuthFailure(this.message);
}

final class PhoneAuthSuccess extends PhoneAuthState {
  final String verificationId;
  PhoneAuthSuccess(this.verificationId);
}

final class CodeSentSuccess extends PhoneAuthState {}

final class CodeSentFailure extends PhoneAuthState {
  final String message;
  CodeSentFailure(this.message);
}
