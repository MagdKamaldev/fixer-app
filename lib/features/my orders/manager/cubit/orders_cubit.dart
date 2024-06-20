import 'package:fixer/features/my%20orders/data/models/order_model/order_model.dart';
import 'package:fixer/features/services/data/models/service_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repos/orders_repo_impl.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final OrdersRepoImpl repo;
  OrdersCubit(this.repo) : super(OrdersInitial());

  static OrdersCubit get(context) => BlocProvider.of(context);

  List<OrderModel> orders = [];

  void getOrders() async {
    emit(OrdersLoading());

    final result = await repo.getOrders();
    result.fold(
      (l) => emit(OrdersFailed(l.message)),
      (r) {
        orders = r;
        emit(OrdersSuccess(r));
      },
    );
  }

  List<ServiceModel> services = [];

  void getOrderServices(int id) async {
    emit(GetOrderServicesLoading());

    final result = await repo.getOrderServices(id);
    result.fold(
      (l) {
        print("${services.length} 11111111111111111111111111111111111111");
        print(l.message);
        emit(GetOrderServicesFailed(l.message));
      },
      (r) {
        services = r;
        print("${services.length} 11111111111111111111111111111111111111");
        emit(GetOrderServicesSuccess(r));
      },
    );
  }
}
