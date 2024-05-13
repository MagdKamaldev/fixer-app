import 'package:dartz/dartz.dart';
import 'package:fixer/core/models/craftsman_model.dart';
import 'package:fixer/core/models/operating_area_model.dart';
import 'package:fixer/core/networks/errors/errors.dart';

abstract class CraftsmanSignUpRepository {
  Future<Either<Failure, CraftsmanModel>> signUpCraftsman(
      CraftsmanModel craftsman);
  Future<Either<Failure,List< OperatingAreaModel>>> getOperatingAreas();
}
