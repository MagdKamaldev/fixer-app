part of 'craftsman_phone_cubit.dart';

sealed class CraftsmanPhoneNumberState {}

final class CraftsmanPhoneNumberInitial extends CraftsmanPhoneNumberState {}

final class CraftsmanPhoneAuthLoading extends CraftsmanPhoneNumberState {}

final class CraftsmanPhoneAuthFailure extends CraftsmanPhoneNumberState {
  final String message;
  CraftsmanPhoneAuthFailure(this.message);
}

final class CraftsmanPhoneAuthSuccess extends CraftsmanPhoneNumberState {
  final String verificationId;
  CraftsmanPhoneAuthSuccess(this.verificationId);
}

final class CraftsmanCodeSentSuccess extends CraftsmanPhoneNumberState {}

final class CraftsmanCodeSentFailure extends CraftsmanPhoneNumberState {
  final String message;
  CraftsmanCodeSentFailure(this.message);
}
