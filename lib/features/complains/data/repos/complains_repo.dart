import 'package:dartz/dartz.dart';
import 'package:fixer/core/networks/errors/errors.dart';
import 'package:fixer/features/complains/data/models/messege_model.dart';

abstract class ComplainsRepository {
  Future<Either<Failure, List<MessegeModel>>> getUserComplains();
  Future<Either<Failure, String>> sendComplain(String message,String contactMail);
}