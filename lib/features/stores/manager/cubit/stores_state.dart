part of 'stores_cubit.dart';

sealed class StoresState {}

final class StoresInitial extends StoresState {}

final class StoresLoading extends StoresState {}

final class StoresSuccess extends StoresState {
  final List<StoreModel> stores;

  StoresSuccess(this.stores);
}

final class StoresFailed extends StoresState {
  final String message;

  StoresFailed(this.message);
}

final class GetStoreItemsLoading extends StoresState {}

final class GetStoreItemsSuccess extends StoresState {
  final List<ItemModel> storeItems;

  GetStoreItemsSuccess(this.storeItems);
}

final class GetStoreItemsFailed extends StoresState {
  final String message;

  GetStoreItemsFailed(this.message);
}
