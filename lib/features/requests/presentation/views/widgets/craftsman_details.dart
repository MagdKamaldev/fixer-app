import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/service_locator/service_locator.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/features/home/presentation/home_view/presentation/views/widgets/shimmer_loading.dart';
import 'package:fixer/features/my%20orders/presentation/order_item.dart';
import 'package:fixer/features/requests/data/models/order_carftsmen_model.dart';
import 'package:fixer/features/requests/data/repos/request_repo_impl.dart';
import 'package:fixer/features/requests/manager/request%20cubit/request_cubit.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CraftsmanDetails extends StatelessWidget {
  final OrderCarftsmenModel craftsman;
  const CraftsmanDetails({super.key, required this.craftsman});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => RequestCubit(getIt<RequestRepoImpl>())
        ..craftsmanReviews(craftsman.id!),
      child: BlocBuilder<RequestCubit, RequestState>(
        builder: (context, state) {
          RequestCubit cubit = RequestCubit.get(context);
          if (state is RequestReviewsLoading) {
            return Scaffold(
                appBar: AppBar(
                  title: Text(
                    craftsman.name!,
                    style: TextStyles.headings,
                  ),
                  centerTitle: true,
                  toolbarHeight: 80,
                ),
                body: const ShimmerLoading());
          } else {
            if (cubit.reviews.isEmpty) {
              return Scaffold(
                appBar: AppBar(
                  title: Text(
                    craftsman.name!,
                    style: TextStyles.headings,
                  ),
                  centerTitle: true,
                  toolbarHeight: 80,
                ),
                body: Container(
                  color: Colors.white,
                  child: Padding(
                      padding:
                          EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
                      child: Column(
                        children: [
                          verticalSpace(size.height * 0.1),
                          SizedBox(
                            height: size.height * 0.4,
                            width: size.width,
                            child: LottieBuilder.asset(
                                "assets/animations/no items found.json"),
                          ),
                          verticalSpace(30),
                          Text(
                            S.of(context).NoReviews,
                            style: TextStyles.lightHeadings,
                          ),
                        ],
                      )),
                ),
              );
            } else {
              return Scaffold(
                appBar: AppBar(
                  title: Text(
                    craftsman.name!,
                    style: TextStyles.headings,
                  ),
                  centerTitle: true,
                  toolbarHeight: 80,
                ),
                body: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: ListView.separated(
                    separatorBuilder: (context, index) => verticalSpace(12),
                    itemCount: cubit.reviews.length,
                    itemBuilder: (context, index) {
                      return OrderContainerModel(
                        text: cubit.reviews[index].name == null
                            ? "Unknown"
                            : cubit.reviews[index].name.toString(),
                        description: cubit.reviews[index].feedback!,
                        backgroundpath: "assets/images/stores_background.jpg",
                      );
                    },
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
