import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/service_locator/service_locator.dart';
import 'package:fixer/features/home/presentation/home_view/presentation/views/widgets/shimmer_loading.dart';
import 'package:fixer/features/my%20orders/data/repos/orders_repo_impl.dart';
import 'package:fixer/features/my%20orders/manager/cubit/orders_cubit.dart';
import 'package:fixer/features/my%20orders/presentation/order_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrdersCubit(getIt<OrdersRepoImpl>())..getOrders(),
      child: BlocBuilder<OrdersCubit, OrdersState>(
        builder: (context, state) {
          OrdersCubit cubit = OrdersCubit.get(context);
          if (state is! OrdersLoading) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView.separated(
                  separatorBuilder: (context, index) => verticalSpace(12),
                  itemCount: cubit.orderds.length,
                  itemBuilder: (context, index) {
                    return OrderContainerModel(
                        text: cubit.orderds[index].total == null
                            ? "unKnown"
                            : cubit.orderds[index].total.toString(),
                        description: cubit.orderds[index].done == true
                            ? "Done"
                            : "Ongoing",
                        backgroundpath: "assets/images/stores_background.jpg");
                  }),
            );
          } else {
            return const ShimmerLoading();
          }
        },
      ),
    );
  }
}
