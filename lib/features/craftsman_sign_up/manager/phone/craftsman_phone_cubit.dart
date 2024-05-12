// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fixer/core/helpers/extensions.dart';
import 'package:fixer/core/networks/errors/error_snackbar.dart';
import 'package:fixer/core/routing/app_router.dart';
import 'package:fixer/core/routing/routes.dart';
import 'package:fixer/features/craftsman_sign_up/presentation/craftsman_confirmation_code/presentation/views/craftsman_confimation_code_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'craftsman_phone_state.dart';

class CraftsmanPhoneNumberCubit extends Cubit<CraftsmanPhoneNumberState> {
  CraftsmanPhoneNumberCubit() : super(CraftsmanPhoneNumberInitial());
  static CraftsmanPhoneNumberCubit get(context) => BlocProvider.of(context);
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void signInWithPhoneNumber(String phoneNumber, context) async {
    emit(CraftsmanPhoneAuthLoading());
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
          emit(CraftsmanPhoneAuthSuccess(credential.verificationId!));
        },
        verificationFailed: (FirebaseAuthException e) {
          showErrorSnackbar(context, e.message!);
          emit(CraftsmanPhoneAuthFailure(e.message!));
        },
        codeSent: (String verificationId, int? resendToken) {
          navigateTo(context,
              CraftsmanConfirmationCodeView(verificationId: verificationId));
          emit(CraftsmanPhoneAuthSuccess(verificationId));
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          emit(CraftsmanPhoneAuthFailure('Time out'));
        },
      );
    } on FirebaseAuthException catch (e) {
      showErrorSnackbar(context, e.message!);
      emit(CraftsmanPhoneAuthFailure(e.message!));
    }
  }

  void verifyPhoneNumber(
      String verificationId, String smsCode, BuildContext context) async {
    emit(CraftsmanPhoneAuthLoading());
    try {
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      await _auth.signInWithCredential(credential);
      context.pushNamed(Routes.password);
      emit(CraftsmanCodeSentSuccess());
    } on FirebaseAuthException catch (e) {
      showErrorSnackbar(context, e.message!);
      emit(CraftsmanCodeSentFailure(e.message!));
    }
  }
}
