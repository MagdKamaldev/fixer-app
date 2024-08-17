// ignore_for_file: deprecated_member_use

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fixer/core/networks/api_constants.dart';
import 'package:fixer/core/networks/api_services/api_services.dart';
import 'package:fixer/core/networks/errors/errors.dart';
import 'package:fixer/features/complains/data/models/messege_model.dart';
import 'package:fixer/features/complains/data/repos/complains_repo.dart';
import 'package:fixer/main.dart';

class ComplainsRepoImpl implements ComplainsRepository {
  final ApiServices apiServices;
  ComplainsRepoImpl({required this.apiServices});

  @override
  Future<Either<Failure, List<MessegeModel>>> getUserComplains() async {
    try {
      final response = await apiServices.getList(
          endPoint: ApiConstants.userComplains, jwt: token!);
      List<MessegeModel> complains = [];
      for (var element in response) {
        complains.add(MessegeModel.fromJson(element));
      }
      return Right(complains);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, String>> sendComplain(
      String message, String contactMail) async {
    try {
      final response = await apiServices.post(
          endPoint: ApiConstants.sendComplain,
          data: {"contact-email": contactMail, "message": message},
          jwt: token!);
      return Right(response["message"]);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
