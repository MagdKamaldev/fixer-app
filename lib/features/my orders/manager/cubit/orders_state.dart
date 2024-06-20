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
