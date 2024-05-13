import 'package:dio/dio.dart';
import 'package:fixer/core/networks/api_services/api_services.dart';
import 'package:fixer/features/craftsman_sign_up/data/repos/craftsman_signup_repo_implementation.dart';
import 'package:fixer/features/user_sign_up/data/repos/user_signup_repository_implementation.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupLocator() {
  getIt.registerLazySingleton<ApiServices>(
    () => ApiServices(
      Dio(),
    ),
  );
  getIt.registerLazySingleton<UserSignUpRepositoryImpelemntation>(
    () => UserSignUpRepositoryImpelemntation(
      apiServices: getIt<ApiServices>(),
    ),
  );
  getIt.registerLazySingleton<CraftsmanSignUpRepositoryImplementation>(
    () => CraftsmanSignUpRepositoryImplementation(
      apiServices: getIt<ApiServices>(),
    ),
  );
}
