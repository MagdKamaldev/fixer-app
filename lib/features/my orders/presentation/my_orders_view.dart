import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/routing/app_router.dart';
import 'package:fixer/core/service_locator/service_locator.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/features/home/presentation/home_view/presentation/views/widgets/shimmer_loading.dart';
import 'package:fixer/features/my%20orders/data/repos/orders_repo_impl.dart';
import 'package:fixer/features/my%20orders/manager/cubit/orders_cubit.dart';
import 'package:fixer/features/my%20orders/presentation/order_details.dart';
import 'package:fixer/features/my%20orders/presentation/order_item.dart';
import 'package:fixer/generated/l10n.dart';
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).myOrders,
                    style: TextStyles.headings,
                  ),
                  verticalSpace(20),
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => verticalSpace(12),
                      itemCount: cubit.orders.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            navigateTo(
                                context,
                                OrderDetails(
                                    orderid: cubit.orders[index].orderId!));
                          },
                          child: OrderContainerModel(
                            text: cubit.orders[index].total == null
                                ? "Unknown"
                                : cubit.orders[index].total.toString(),
                            description: cubit.orders[index].done == true
                                ? "Done"
                                : "Ongoing",
                            backgroundpath:
                                "assets/images/stores_background.jpg",
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const ShimmerLoading();
          }
        },
      ),
    );
  }
}