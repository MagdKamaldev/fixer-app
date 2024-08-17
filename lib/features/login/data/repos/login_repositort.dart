import 'package:dartz/dartz.dart';
import 'package:fixer/core/networks/errors/errors.dart';

abstract class LoginRepository {
  Future<Either<Failure, void>> login(String email, String password);
}
