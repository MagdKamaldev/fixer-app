import 'package:firebase_auth/firebase_auth.dart';
import 'package:fixer/core/networks/errors/error_snackbar.dart';
import 'package:fixer/features/login/data/repos/login_repositort.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository repo;
  LoginCubit(this.repo) : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);

  void login(String email, String password, context) async {
    emit(LoginLoading());
    final response = await repo.login(email, password);
    response.fold(
      (l) {
        showErrorSnackbar(context, l.message);
        emit(LoginFailed(l.message));
      },
      (r) {
        emit(LoginSuccess(""));
      },
    );
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> signUpWithGoogle(context) async {
    emit(GoogleSignUpLoading());
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      login(googleUser!.email, "Google", context);
      emit(GoogleSignUpSuccess());
    } catch (e) {
      showErrorSnackbar(context, e.toString());
      emit(GoogleSignUpFailure(e.toString()));
    }
  }
}
