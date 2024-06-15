// ignore_for_file: deprecated_member_use
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fixer/core/constants/constants.dart';
import 'package:fixer/core/models/operating_area_model.dart';
import 'package:fixer/core/networks/api_constants.dart';
import 'package:fixer/core/networks/api_services/api_services.dart';
import 'package:fixer/core/networks/errors/errors.dart';
import 'package:fixer/features/craftsman_sign_up/data/models/craftsman_model.dart';
import 'package:fixer/features/craftsman_sign_up/data/repos/craftsman_repository.dart';
import 'package:fixer/main.dart';

class CraftsmanSignUpRepositoryImplementation
    implements CraftsmanSignUpRepository {
  final ApiServices apiServices;
  CraftsmanSignUpRepositoryImplementation({required this.apiServices});

  @override
  Future<Either<Failure, List<OperatingAreaModel>>> getOperatingAreas() async {
    try {
      final response =
          await apiServices.getList(endPoint: ApiConstants.operatingLocations);
      final operatingAreas =
          response.map((item) => OperatingAreaModel.fromJson(item)).toList();
      return Right(operatingAreas);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, CraftsmanModel>> signUpCraftsman(
      CraftsmanModel craftsman) async {
    try {
      final response = await apiServices.post(
        endPoint: ApiConstants.registerCraftsman,
        data: craftsman.toJson(),
      );

      final craftsmanModel = CraftsmanModel.fromJson(response);
      token = response["jwt"];
      kTokenBox.put(kTokenBoxString, token);
      return Right(craftsmanModel);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, String>> setOperatingAreas(List<dynamic> areas) async {
    try {
      final response = await apiServices.post(
          endPoint: ApiConstants.craftsmanSetLocations,
          jwt: token,
          data: {"locations": areas});
      return Right(response["message"]);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, String>> uploadImage(File front, File back) async {
    try {
      final response = await apiServices.post(
          endPoint: ApiConstants.craftsmanUploadPhotos,
          jwt: token,
          data: FormData.fromMap({
            "front": await MultipartFile.fromFile(front.path),
            "back": await MultipartFile.fromFile(back.path),
          }));
      return Right(response["Front image url"]);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, String>> uploadProfile(File image) async {
    try {
      final response = await apiServices.put(
          endPoint: ApiConstants.craftsmanProfile,
          jwt: token,
          data: FormData.fromMap({
            "profile": await MultipartFile.fromFile(image.path),
          }));
      return Right(response["Message"]);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
