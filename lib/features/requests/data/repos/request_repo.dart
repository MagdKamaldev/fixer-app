import 'package:dartz/dartz.dart';
import 'package:fixer/core/networks/errors/errors.dart';
import 'package:fixer/features/requests/data/models/order_carftsmen_model.dart';

abstract class RequestRepo {
  Future<Either<Failure, int>> request(List<String> services);
  Future<Either<Failure, List<OrderCarftsmenModel>>> requestCraftsmen(
      int orderId, String location);
}
