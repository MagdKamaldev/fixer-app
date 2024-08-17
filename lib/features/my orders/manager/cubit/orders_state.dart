part of 'orders_cubit.dart';

sealed class OrdersState {}

final class OrdersInitial extends OrdersState {}

final class OrdersLoading extends OrdersState {}

final class OrdersSuccess extends OrdersState {
  final List<OrderModel> orders;
  OrdersSuccess(this.orders);
}

final class OrdersFailed extends OrdersState {
  final String message;
  OrdersFailed(this.message);
}

final class GetOrderServicesLoading extends OrdersState {}

final class GetOrderServicesSuccess extends OrdersState {
  final List<ServiceModel> services;
  GetOrderServicesSuccess(this.services);
}

final class GetOrderServicesFailed extends OrdersState {
  final String message;
  GetOrderServicesFailed(this.message);
}
