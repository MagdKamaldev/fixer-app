import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/routing/app_router.dart';
import 'package:fixer/core/service_locator/service_locator.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/features/home/presentation/home_view/presentation/views/widgets/shimmer_loading.dart';
import 'package:fixer/features/my%20orders/data/repos/orders_repo_impl.dart';
import 'package:fixer/features/my%20orders/manager/cubit/orders_cubit.dart';
import 'package:fixer/features/my%20orders/presentation/order_details.dart';
import 'package:fixer/features/my%20orders/presentation/order_details_model.dart';
import 'package:fixer/features/my%20orders/presentation/order_item.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => OrdersCubit(getIt<OrdersRepoImpl>())..getOrders(),
      child: BlocBuilder<OrdersCubit, OrdersState>(
        builder: (context, state) {
          OrdersCubit cubit = OrdersCubit.get(context);
          if (state is OrdersLoading) {
            return const ShimmerLoading();
          } else if (state is OrdersSuccess) {
            if (cubit.orders.isNotEmpty) {
              return Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).myOrders,
                        style: TextStyles.subHeadingsBold,
                      ),
                      verticalSpace(20),
                      Expanded(
                        child: ListView.separated(
                          separatorBuilder: (context, index) =>
                              verticalSpace(12),
                          itemCount: cubit.orders.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () {
                                  navigateTo(
                                      context,
                                      OrderDetails(
                                          orderid:
                                              cubit.orders[index].orderId!));
                                },
                                child: OrderDetailsModel(
                                  craftsId: cubit.orders[index].craftsmanId!,
                                  time: cubit.orders[index].date!,
                                  id: cubit.orders[index].orderId!,
                                  price: cubit.orders[index].total.toString(),
                                ));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Container(
                color: Colors.white,
                child: Padding(
                    padding:
                        EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.4,
                          width: size.width,
                          child: LottieBuilder.asset(
                              "assets/animations/no items found.json"),
                        ),
                        verticalSpace(30),
                        Text(
                          S.of(context).noRequests,
                          style: TextStyles.lightHeadings,
                        ),
                      ],
                    )),
              );
            }
          } else if (state is OrdersFailed) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

// OrderDetailsModel(
//                               orderStatus:cubit.orders[index].done == true
//                                   ? "Done"
//                                   : "Ongoing",
//                               text: cubit.orders[index].total == null
//                                   ? "Unknown"
//                                   : cubit.orders[index].total.toString(),
//                               serviceName: cubit.services[index].name == null
//                           ? "Unknown"
//                           : cubit.services[index].name.toString(),
//                               price: cubit.services[index].price.toString(),)
//                           );
