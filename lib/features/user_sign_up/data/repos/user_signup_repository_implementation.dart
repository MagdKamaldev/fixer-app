// ignore_for_file: deprecated_member_use
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fixer/core/models/user_model/user_model.dart';
import 'package:fixer/core/networks/api_constants.dart';
import 'package:fixer/core/networks/api_services/api_services.dart';
import 'package:fixer/core/networks/errors/errors.dart';
import 'package:fixer/features/user_sign_up/data/repos/user_sign_up_repository.dart';

class UserSignUpRepositoryImpelemntation implements UserSignUpRepository {
  final ApiServices apiServices;
  UserSignUpRepositoryImpelemntation({required this.apiServices});

  @override
  Future<Either<Failure, UserModel>> userSignUp(UserModel user,String password) async {
    try {
      final response =
          await apiServices.post(endPoint: ApiConstants.registerClient, data: {
        "name": user.name,
        "username":user.name,
        "email": user.email,
        "password": password,
        "phone": user.phone,
        "user_type": user.userType,
          });
      final userModel = UserModel.fromJson(response);
      return Right(userModel);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
