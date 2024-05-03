import 'package:firebase_auth/firebase_auth.dart';
import 'package:fixer/core/networks/errors/error_snackbar.dart';
import 'package:fixer/core/routing/app_router.dart';
import 'package:fixer/features/user_sign_up/presentation/user_confirmation_code/presentation/views/user_confimation_code_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'phone_auth_state.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  PhoneAuthCubit() : super(PhoneAuthInitial());
  static PhoneAuthCubit get(context) => BlocProvider.of(context);

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void signInWithPhoneNumber(String phoneNumber, context) async {
    emit(PhoneAuthLoading());
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
          emit(PhoneAuthSuccess(credential.verificationId!));
        },
        verificationFailed: (FirebaseAuthException e) {
          showErrorSnackbar(context, e.message!);
          emit(PhoneAuthFailure(e.message!));
        },
        codeSent: (String verificationId, int? resendToken) {
          navigateTo(context,
              UserConfirmationCodeView(verificationId: verificationId));
          emit(PhoneAuthSuccess(verificationId));
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          emit(PhoneAuthFailure('Time out'));
        },
      );
    } on FirebaseAuthException catch (e) {
      showErrorSnackbar(context, e.message!);
      emit(PhoneAuthFailure(e.message!));
    }
  }

  void verifyPhoneNumber(String verificationId, String smsCode, context) async {
    emit(PhoneAuthLoading());
    try {
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      await _auth.signInWithCredential(credential);
      Navigator.pop(context);

      emit(CodeSentSuccess());
    } on FirebaseAuthException catch (e) {
      showErrorSnackbar(context, e.message!);
      emit(CodeSentFailure(e.message!));
    }
  }
}
