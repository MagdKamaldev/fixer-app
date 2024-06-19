import 'package:dartz/dartz.dart';
import 'package:fixer/core/constants/constants.dart';
import 'package:fixer/core/networks/api_services/api_services.dart';
import 'package:fixer/core/networks/errors/errors.dart';
import 'package:fixer/features/requests/data/repos/request_repo.dart';
import 'package:fixer/main.dart';

class RequestRepoImpl implements RequestRepo {
  final ApiServices apiServices;

  RequestRepoImpl({required this.apiServices});
  @override
  Future<Either<Failure, int>> request(List<String> services) async {
    try {
      final response = await apiServices.post(
          endPoint: "request",
          data: {
            "services": services,
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
}
