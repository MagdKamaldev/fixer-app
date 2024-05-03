import 'package:firebase_auth/firebase_auth.dart';
import 'package:fixer/core/models/user_model/user_model.dart';
import 'package:fixer/core/networks/errors/error_snackbar.dart';
import 'package:fixer/features/user_sign_up/data/repos/user_signup_repository_implementation.dart';
import 'package:fixer/features/user_sign_up/presentation/user_phone_number/presentation/views/widgets/user_phone_number_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
part 'user_sign_up_state.dart';

class UserSignUpCubit extends Cubit<UserSignUpState> {
  UserSignUpCubit(this.userSignUpRepositoryImpelemntation)
      : super(UserSignUpInitial());
  final UserSignUpRepositoryImpelemntation userSignUpRepositoryImpelemntation;
  static UserSignUpCubit get(context) => BlocProvider.of(context);

  PageController pageController = PageController();

  bool is1Done = false;
  bool is2Done = false;
  bool is3Done = false;

  void changePageState(int page, bool value) {
    if (page == 1) {
      is1Done = value;
      emit(ChangePageState());
    } else if (page == 2) {
      is2Done = value;
      emit(ChangePageState());
    } else if (page == 3) {
      is3Done = value;
      emit(ChangePageState());
    }
  }

  Future<void> userSignUp(UserModel user, String password) async {
    emit(UserSignUpLoading());
    final response =
        await userSignUpRepositoryImpelemntation.userSignUp(user, password);
    response.fold((l) {
      emit(UserSignUpFailure(l.message));
    }, (r) {
      emit(UserSignUpSuccess(r));
    });
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> signUpWithGoogle(context) async {
    emit(GoogleSignUpLoading());
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      userSignUp(
          UserModel(
            email: googleUser.email,
            name: googleUser.displayName,
            username: googleUser.displayName,
            userType: "client",
            phone: phoneNumber,
          ),
          "google");
      emit(GoogleSignUpSuccess(credential));
    } catch (e) {
      showErrorSnackbar(context, e.toString());
      emit(GoogleSignUpFailure(e.toString()));
    }
  }
}
