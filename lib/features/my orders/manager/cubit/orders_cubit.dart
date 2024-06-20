
import 'package:fixer/features/my%20orders/data/models/order_model/order_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repos/orders_repo_impl.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final OrdersRepoImpl repo;
  OrdersCubit(this.repo) : super(OrdersInitial());

  static OrdersCubit get(context) => BlocProvider.of(context);

  List<OrderModel> orderds = [];

  void getOrders() async {
    emit(OrdersLoading());

    final result = await repo.getOrders();
    result.fold(
      (l) => emit(OrdersFailed(l.message)),
      (r) {
        orderds = r;
        emit(OrdersSuccess(r));
      } ,
    );
  }
}
