import 'package:dartz/dartz.dart';
import 'package:fixer/core/networks/api_services/api_services.dart';
import 'package:fixer/core/networks/errors/errors.dart';
import 'package:fixer/features/services/data/models/service_model.dart';
import 'package:fixer/features/services/data/reepos/services_repo.dart';

class ServicesRepoImpl implements ServicesRepo {
  final ApiServices apiServices;
  ServicesRepoImpl({required this.apiServices});

  @override
  Future<Either<Failure, List<ServiceModel>>> getServices(int category) async {
    try {
      final response = await apiServices.getList(
        endPoint: "Admin/$category",
      );
      final List<ServiceModel> services =
          (response).map((e) => ServiceModel.fromJson(e)).toList();
      return Right(services);
    } catch (e) {
      if (e is ServerFailure) {
        return Left(ServerFailure(e.message));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
