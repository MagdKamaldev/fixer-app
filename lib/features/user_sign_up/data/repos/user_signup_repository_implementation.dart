import 'package:dartz/dartz.dart';
import 'package:fixer/core/models/user_model/user_model.dart';
import 'package:fixer/core/networks/api_services/api_services.dart';
import 'package:fixer/core/networks/errors/errors.dart';
import 'package:fixer/features/user_sign_up/data/repos/user_sign_up_repository.dart';

class UserSignUpRepositoryImpelemntation implements UserSignUpRepository {
  final ApiServices apiServices;
  UserSignUpRepositoryImpelemntation({required this.apiServices});

  
  @override
  Future<Either<Failure, UserModel>> userSignUp(UserModel user) {
    // TODO: implement userSignUp
    throw UnimplementedError();
  }
}
