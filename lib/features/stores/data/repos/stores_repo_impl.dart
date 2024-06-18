// ignore_for_file: deprecated_member_use

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fixer/core/networks/api_constants.dart';
import 'package:fixer/core/networks/api_services/api_services.dart';
import 'package:fixer/core/networks/errors/errors.dart';
import 'package:fixer/features/stores/data/models/item_model/item_model.dart';
import 'package:fixer/features/stores/data/models/stores_model.dart';
import 'package:fixer/features/stores/data/repos/stores_repo.dart';

class StoresRepoImpl implements StoresRepo {
  final ApiServices apiservices;

  StoresRepoImpl({required this.apiservices});

  @override
  Future<Either<Failure, List<ItemModel>>> getStoreItems(int id) async {
    try {
      final response = await apiservices.getList(endPoint: "Store/$id/items");
      final List<ItemModel> itemList = [];
      for (var item in response) {
        itemList.add(ItemModel.fromJson(item));
      }
      return Right(itemList);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<StoreModel>>> getStores() async {
    try {
      final response = await apiservices.get(endPoint: ApiConstants.getStores);
      final List<StoreModel> storeList = [];
      for (var item in response["stores"]) {
        storeList.add(StoreModel.fromJson(item));
      }
      return Right(storeList);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
