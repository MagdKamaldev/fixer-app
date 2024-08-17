import 'package:fixer/core/networks/errors/error_snackbar.dart';
import 'package:fixer/features/complains/data/models/messege_model.dart';
import 'package:fixer/features/complains/data/repos/complains_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'complains_state.dart';

class ComplainsCubit extends Cubit<ComplainsState> {
  final ComplainsRepoImpl rep;
  ComplainsCubit(this.rep) : super(ComplainsInitial());
  static ComplainsCubit get(context) => BlocProvider.of(context);

  List<MessegeModel> complains = [];

  void getUserComplains() async {
    complains = [];
    emit(ComplainsLoading());
    final response = await rep.getUserComplains();
    response.fold(
      (l) {
        emit(ComplainsError(l.message));
      },
      (r) {
        complains = r;
        emit(ComplainsLoaded(r));
      },
    );
  }

  Future<void> sendComplain(String message, String contactMail, context) async {
    emit(SendComplainLoading());
    final response = await rep.sendComplain(message, contactMail);
    response.fold(
      (l) {
        showErrorSnackbar(context, l.message);
        emit(ComplainsError(l.message));
      },
      (r) {
        Navigator.pop(context);
        emit(SendComplainSuccess(r));
      },
    );
  }
}
