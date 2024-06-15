import 'dart:io';

import 'package:dartz/dartz.dart';

import 'package:fixer/core/models/operating_area_model.dart';
import 'package:fixer/core/networks/errors/errors.dart';
import 'package:fixer/features/craftsman_sign_up/data/models/craftsman_model.dart';

abstract class CraftsmanSignUpRepository {
  Future<Either<Failure, CraftsmanModel>> signUpCraftsman(
      CraftsmanModel craftsman);
  Future<Either<Failure, List<OperatingAreaModel>>> getOperatingAreas();
  Future<Either<Failure, String>> setOperatingAreas(List<dynamic> areas);
  Future<Either<Failure, String>> uploadImage(File fonr, File back);
  Future<Either<Failure, String>> uploadProfile(File image);
}
