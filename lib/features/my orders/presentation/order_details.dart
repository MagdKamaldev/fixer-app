import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/service_locator/service_locator.dart';
import 'package:fixer/features/my%20orders/data/repos/orders_repo_impl.dart';
import 'package:fixer/features/my%20orders/manager/cubit/orders_cubit.dart';
import 'package:fixer/features/my%20orders/presentation/order_details_model.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderDetails extends StatelessWidget {
  final int orderid;
  const OrderDetails({super.key, required this.orderid});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          OrdersCubit(getIt<OrdersRepoImpl>())..getOrderServices(orderid),
      child: BlocBuilder<OrdersCubit, OrdersState>(
        builder: (context, state) {
          OrdersCubit cubit = OrdersCubit.get(context);
          if (state is GetOrderServicesLoading) {
            return Scaffold(
                appBar: AppBar(
                  title: Text(S.of(context).orderDeatils),
                  centerTitle: true,
                ),
                body: const Center(child: CircularProgressIndicator()));
          } else {
            return Scaffold(
              appBar: AppBar(
                title: Text(S.of(context).orderDeatils),
                centerTitle: true,
              ),
              body: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: ListView.separated(
                  separatorBuilder: (context, index) => verticalSpace(12),
                  itemCount: cubit.services.length,
                  itemBuilder: (context, index) {
                    return OrderDetailsModel(
                      serviceName:cubit.services[index].name == null
                          ? "Unknown"
                          : cubit.services[index].name.toString(),
                      price: cubit.services[index].price.toString(),
                      ) ;
                  },
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

// OrderContainerModel(
//                       text: cubit.services[index].name == null
//                           ? "Unknown"
//                           : cubit.services[index].name.toString(),
//                       description: cubit.services[index].price.toString(),
//                       backgroundpath: "assets/images/stores_background.jpg",
//                     )