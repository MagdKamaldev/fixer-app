import 'package:dio/dio.dart';
import 'package:fixer/core/networks/api_services/api_services.dart';
import 'package:fixer/features/complains/data/repos/complains_repo_impl.dart';
import 'package:fixer/features/craftsman_sign_up/data/repos/craftsman_signup_repo_implementation.dart';
import 'package:fixer/features/craftsman_wallet/data/wallet_repo_impl.dart';
import 'package:fixer/features/login/data/repos/login_repository_implementation.dart';
import 'package:fixer/features/my%20orders/data/repos/orders_repo_impl.dart';
import 'package:fixer/features/profile/data/repos/profile_repo_impl.dart';
import 'package:fixer/features/requests/data/repos/request_repo_impl.dart';
import 'package:fixer/features/services/data/reepos/services_repo_impl.dart';
import 'package:fixer/features/stores/data/repos/stores_repo_impl.dart';
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
  getIt.registerLazySingleton<LoginRepositoryImplementation>(
    () => LoginRepositoryImplementation(
      apiServices: getIt<ApiServices>(),
    ),
  );
  getIt.registerLazySingleton<ComplainsRepoImpl>(
    () => ComplainsRepoImpl(
      apiServices: getIt<ApiServices>(),
    ),
  );
  getIt.registerLazySingleton<ProfileRepoImpl>(
    () => ProfileRepoImpl(
      apiServices: getIt<ApiServices>(),
    ),
  );
  getIt.registerLazySingleton<StoresRepoImpl>(
    () => StoresRepoImpl(
      apiservices: getIt<ApiServices>(),
    ),
  );
  getIt.registerLazySingleton<ServicesRepoImpl>(
    () => ServicesRepoImpl(
      apiServices: getIt<ApiServices>(),
    ),
  );
  getIt.registerLazySingleton<RequestRepoImpl>(
    () => RequestRepoImpl(
      apiServices: getIt<ApiServices>(),
    ),
  );
  getIt.registerLazySingleton<OrdersRepoImpl>(
    () => OrdersRepoImpl(
      apiServices: getIt<ApiServices>(),
    ),
  );
  getIt.registerLazySingleton<WalletRepoImpl>(
    () => WalletRepoImpl(
      apiServices: getIt<ApiServices>(),
    ),
  );
}
