import 'package:fixer/core/models/user_model/user_model.dart';
import 'package:fixer/features/user_sign_up/data/repos/user_sign_up_repository.dart';
import 'package:fixer/features/user_sign_up/data/repos/user_signup_repository_implementation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'user_sign_up_state.dart';

class UserSignUpCubit extends Cubit<UserSignUpState> {
  UserSignUpCubit(this.userSignUpRepositoryImpelemntation)
      : super(UserSignUpInitial());
  final UserSignUpRepositoryImpelemntation userSignUpRepositoryImpelemntation;
  static UserSignUpCubit get(context) => BlocProvider.of(context);

  PageController controller = PageController();

  bool is1Done = false;
  bool is2Done = false;
  bool is3Done = false;

  void changePageState(int page) {
    if (page == 1) {
      is1Done = !is1Done;
      emit(ChangePageState());
    } else if (page == 2) {
      is2Done = !is2Done;
      emit(ChangePageState());
    } else if (page == 3) {
      is3Done = !is3Done;
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
}
