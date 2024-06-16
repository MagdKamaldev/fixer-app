import 'package:dartz/dartz.dart';
import 'package:fixer/core/networks/errors/errors.dart';
import 'package:fixer/features/stores/data/models/item_model/item_model.dart';
import 'package:fixer/features/stores/data/models/stores_model.dart';

abstract class StoresRepo {
  Future<Either<Failure, List<StoreModel>>> getStores();
  Future<Either<Failure, List<ItemModel>>> getStoreItems(int id);
}
