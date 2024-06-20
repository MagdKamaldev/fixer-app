import 'package:dartz/dartz.dart';
import 'package:fixer/core/constants/constants.dart';
import 'package:fixer/core/networks/api_services/api_services.dart';
import 'package:fixer/core/networks/errors/errors.dart';
import 'package:fixer/features/craftsman_wallet/data/wallet_repo.dart';
import 'package:fixer/main.dart';

class WalletRepoImpl implements WalletRepo {
  final ApiServices apiServices;

  WalletRepoImpl({required this.apiServices});

  @override
  Future<Either<Failure, double>> getWallet() async {
    try {
      final response = await apiServices.get(
        endPoint: "Craftsman/balance",
        jwt: token == "" ? kTokenBox.get(kTokenBoxString) : token,
      );

      return Right(response["My balance"]);
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
