import 'package:dartz/dartz.dart';
import 'package:fixer/core/models/user_model/user_model.dart';
import 'package:fixer/core/networks/errors/errors.dart';

abstract class UserSignUpRepository {
  Future<Either<Failure, UserModel>> userSignUp(UserModel user,String password);
}