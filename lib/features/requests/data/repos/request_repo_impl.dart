import 'package:dartz/dartz.dart';
import 'package:fixer/core/constants/constants.dart';
import 'package:fixer/core/networks/api_services/api_services.dart';
import 'package:fixer/core/networks/errors/errors.dart';
import 'package:fixer/features/requests/data/models/order_carftsmen_model.dart';
import 'package:fixer/features/requests/data/models/review_model.dart';
import 'package:fixer/features/requests/data/repos/request_repo.dart';
import 'package:fixer/features/requests/manager/request%20cubit/request_cubit.dart';
import 'package:fixer/main.dart';

class RequestRepoImpl implements RequestRepo {
  final ApiServices apiServices;

  RequestRepoImpl({required this.apiServices});
  @override
  Future<Either<Failure, int>> request(
      List<String> services, String additional,String location) async {
    try {
      final response = await apiServices.post(
          endPoint: "request",
          data: {
            "services": services,
            "date": DateTime.now().toString(),
            "area": orderLocation.toLowerCase(),
            "additional": additional
          },
          jwt: token == "" ? kTokenBox.get(kTokenBoxString) : token);

      return Right(response["Order number "]);
    } catch (e) {
      if (e is ServerFailure) {
        return Left(ServerFailure(e.message));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<OrderCarftsmenModel>>> requestCraftsmen(
      int orderId, ) async {
    try {
      final response =
          await apiServices.get(endPoint: "craftsmenForOrder", data: {
        "order_id": orderId,
      });

      if (response["Craftsmen"] == null) {
        return Left(ServerFailure(response["Message"]));
      } else {
        List<OrderCarftsmenModel> craftsmen = (response["Craftsmen"] as List)
            .map((e) => OrderCarftsmenModel.fromJson(e))
            .toList();
        return Right(craftsmen);
      }
    } catch (e) {
      if (e is ServerFailure) {
        return Left(ServerFailure(e.message));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<ReviewModel>>> craftsmanReviews(
      int craftsmanId) async {
    try {
      final response = await apiServices.get(
        endPoint: "CraftsmanReviews/$craftsmanId",
      );

      if (response["Reviews"] == null) {
        return Left(ServerFailure(response["Message"]));
      } else {
        List<ReviewModel> reviews = (response["Reviews"] as List)
            .map((e) => ReviewModel.fromJson(e))
            .toList();
        return Right(reviews);
      }
    } catch (e) {
      if (e is ServerFailure) {
        return Left(ServerFailure(e.message));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, String>> endRequest(
      int requestId, int rate, String feedBack) async {
    try {
      final response = await apiServices.post(
          endPoint: "CloseRequest/$requestId",
          data: {"rate": rate, "feedback": feedBack});
      return Right(response["Message"]);
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> selectCraftsman(
      int requestId, int craftsmanId) async {
    try {
      final response = await apiServices
          .post(endPoint: "SelectCraftsman/$requestId/$craftsmanId", data: {});
      return Right(response["Message"]);
    } catch (e) {
      if (e is ServerFailure) {
        return Left(ServerFailure(e.message));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
