import 'package:dartz/dartz.dart';
import 'package:fixer/core/networks/errors/errors.dart';

abstract class WalletRepo{
  Future<Either<Failure, double>> getWallet();
}