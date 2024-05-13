// ignore_for_file: deprecated_member_use

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fixer/core/models/craftsman_model.dart';
import 'package:fixer/core/models/operating_area_model.dart';
import 'package:fixer/core/networks/api_constants.dart';
import 'package:fixer/core/networks/api_services/api_services.dart';
import 'package:fixer/core/networks/errors/errors.dart';
import 'package:fixer/features/craftsman_sign_up/data/repos/craftsman_repository.dart';

class CraftsmanSignUpRepositoryImplementation
    implements CraftsmanSignUpRepository {
  final ApiServices apiServices;
  CraftsmanSignUpRepositoryImplementation({required this.apiServices});

  @override
  Future<Either<Failure, List<OperatingAreaModel>>> getOperatingAreas() async {
    try{
    final response =
        await apiServices.getList(endPoint: ApiConstants.operatingLocations);
    final operatingAreas =
        response.map((item) => OperatingAreaModel.fromJson(item)).toList();
    return Right(operatingAreas);
    }catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, CraftsmanModel>> signUpCraftsman(
      CraftsmanModel craftsman) {
    // TODO: implement signUpCraftsman
    throw UnimplementedError();
  }
}
