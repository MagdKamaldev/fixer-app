import 'package:dartz/dartz.dart';
import 'package:fixer/core/networks/errors/errors.dart';

abstract class RequestRepo {
  Future<Either<Failure, int>> request(List<String> services);
}
