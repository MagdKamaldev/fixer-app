import 'package:dartz/dartz.dart';
import 'package:fixer/core/constants/constants.dart';
import 'package:fixer/core/networks/api_services/api_services.dart';
import 'package:fixer/core/networks/errors/errors.dart';
import 'package:fixer/features/profile/data/models/profile_model.dart';
import 'package:fixer/features/profile/data/repos/profile_repo.dart';
import 'package:fixer/main.dart';

class ProfileRepoImpl implements ProfileRepository {
  final ApiServices apiServices;
  ProfileRepoImpl({required this.apiServices});
  @override
  Future<Either<Failure, ProfileModel>> getProfile() async {
    try {
      final response = await apiServices.get(
          endPoint: 'Profile',
          jwt: token == "" ? kTokenBox.get(kTokenBoxString) : token);
      final user = ProfileModel.fromJson(response["User"] ?? response["user"]);
      return Right(user);
    } catch (e) {
      if (e is ServerFailure) {
        return Left(ServerFailure(e.message));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
