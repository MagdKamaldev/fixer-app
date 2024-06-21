import 'package:dartz/dartz.dart';
import 'package:fixer/core/constants/constants.dart';
import 'package:fixer/core/networks/api_services/api_services.dart';
import 'package:fixer/core/networks/errors/errors.dart';
import 'package:fixer/features/my%20orders/data/models/order_model/order_model.dart';
import 'package:fixer/features/services/data/models/service_model.dart';
import 'package:fixer/main.dart';

import 'orders_repo.dart';

class OrdersRepoImpl implements OrdersRepo {
  final ApiServices apiServices;
  OrdersRepoImpl({required this.apiServices});

  @override
  Future<Either<Failure, List<ServiceModel>>> getOrderServices(int id) async {
    try {
      final response = await apiServices.get(
        endPoint: "OrderServices/$id",
        jwt: token == "" ? kTokenBox.get(kTokenBoxString) : token,
      );

      if (response["services"] == null ||
          response["services"]["services"] == null) {
        return Left(ServerFailure("No services found"));
      }

      List<ServiceModel> services = (response["services"]["services"] as List)
          .map((item) => ServiceModel.fromJson(item))
          .toList();

      return Right(services);
    } catch (e) {
      if (e is ServerFailure) {
        return Left(ServerFailure(e.message));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<OrderModel>>> getOrders() async {
    try {
      final response = await apiServices.get(
          endPoint: "MyOrders",
          jwt: token == "" ? kTokenBox.get(kTokenBoxString) : token);

      List<OrderModel> orders = (response["My orders"] as List)
          .map((e) => OrderModel.fromJson(e))
          .toList();
      return Right(orders);
    } catch (e) {
      if (e is ServerFailure) {
        return Left(ServerFailure(e.message));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
