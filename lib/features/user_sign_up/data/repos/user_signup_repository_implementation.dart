// ignore_for_file: deprecated_member_use
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fixer/core/constants/constants.dart';
import 'package:fixer/core/models/location_model.dart';
import 'package:fixer/core/models/user_model.dart';
import 'package:fixer/core/networks/api_constants.dart';
import 'package:fixer/core/networks/api_services/api_services.dart';
import 'package:fixer/core/networks/errors/errors.dart';
import 'package:fixer/features/user_sign_up/data/repos/user_sign_up_repository.dart';
import 'package:fixer/main.dart';

class UserSignUpRepositoryImpelemntation implements UserSignUpRepository {
  final ApiServices apiServices;
  UserSignUpRepositoryImpelemntation({required this.apiServices});

  @override
  Future<Either<Failure, UserModel>> userSignUp(
      UserModel user, String password) async {
    try {
      final response =
          await apiServices.post(endPoint: ApiConstants.registerClient, data: {
        "name": user.name,
        "username": user.name,
        "Email": user.email,
        "password": password,
        "phone": user.phone,
        "user_type": "client",
      });
      final userModel = UserModel.fromJson(response["user"]);
      token = response["jwt"];
      kTokenBox.put(kTokenBoxString, token);
      return Right(userModel);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, LocationModel>> setLocation(
    LocationModel location,
  ) async {
    try {
      final response = await apiServices
          .post(endPoint: ApiConstants.setLocation, jwt: token, data: {
        "lat": location.lat,
        "long": location.long,
        "city": location.city,
        "district": location.district,
        "building": location.building,
        "street": location.street,
        "floor": location.floor,
        "apartment": location.apartment,
        "additional": location.additional,
      });

      final locationModel = LocationModel.fromJson(response["location"]);
      return Right(locationModel);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
