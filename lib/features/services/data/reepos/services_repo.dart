import 'package:dartz/dartz.dart';
import 'package:fixer/core/networks/errors/errors.dart';
import 'package:fixer/features/services/data/models/service_model.dart';

abstract class ServicesRepo {
  Future<Either<Failure, List<ServiceModel>>> getServices(int category);
}
