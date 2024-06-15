import 'package:fixer/features/profile/data/models/profile_model.dart';
import 'package:fixer/features/profile/data/repos/profile_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository repo;
  ProfileCubit(this.repo) : super(ProfileInitial());
  static ProfileCubit get(context) => BlocProvider.of(context);

  ProfileModel? user;

  void getProfile() async {
    emit(ProfileLoading());
    final result = await repo.getProfile();
    result.fold(
      (l) => emit(ProfileError(l.message)),
      (r) {
        user = r;
        emit(ProfileLoaded(user!));
      },
    );
  }
}
