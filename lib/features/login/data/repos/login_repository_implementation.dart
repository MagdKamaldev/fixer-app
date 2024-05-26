// ignore_for_file: deprecated_member_use, void_checks
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fixer/core/constants/constants.dart';
import 'package:fixer/core/networks/api_constants.dart';
import 'package:fixer/core/networks/api_services/api_services.dart';
import 'package:fixer/core/networks/errors/errors.dart';
import 'package:fixer/features/login/data/repos/login_repositort.dart';
import 'package:fixer/main.dart';

bool isPending = false;

class LoginRepositoryImplementation implements LoginRepository {
  final ApiServices apiServices;
  LoginRepositoryImplementation({required this.apiServices});

  @override
    Future<Either<Failure, void>> login(String email, String password) async {
      try {
        final response = await apiServices.post(
          endPoint: ApiConstants.login,
          data: {
            "handler": email,
            "password": password,
          },
        );
        if (response['jwt'] != null) {
          token = response["jwt"];
          kTokenBox.put(kTokenBoxString, token);
          return Right(response["message"]);
        } else {
          isPending = true;
          return Right(response["message"]);
        }
      } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
