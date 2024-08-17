import 'package:fixer/core/helpers/extensions.dart';
import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/routing/routes.dart';
import 'package:fixer/core/service_locator/service_locator.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/features/complains/data/repos/complains_repo_impl.dart';
import 'package:fixer/features/complains/manager/cubit/complains_cubit.dart';
import 'package:fixer/features/complains/presentation/widgets/messege_item.dart';
import 'package:fixer/features/complains/presentation/widgets/messege_shimmer.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class ComplainsView extends StatelessWidget {
  const ComplainsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ComplainsCubit(getIt<ComplainsRepoImpl>())..getUserComplains(),
      child: BlocBuilder<ComplainsCubit, ComplainsState>(
        builder: (context, state) {
          ComplainsCubit cubit = ComplainsCubit.get(context);
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  S.of(context).complains,
                  style: TextStyles.headings,
                ),
                centerTitle: true,
                toolbarHeight: 80.h,
              ),
              body: state is ComplainsLoading
                  ? Padding(
                      padding:
                          EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
                      child: ListView.separated(
                          separatorBuilder: (context, index) =>
                              verticalSpace(10),
                          itemCount: 8,
                          itemBuilder: (context, index) {
                            return const ShimmerRoundedMessageCard();
                          }),
                    )
                  : cubit.complains.isNotEmpty
                      ? Padding(
                          padding: EdgeInsets.only(
                              top: 20.h, left: 20.w, right: 20.w),
                          child: ListView.separated(
                              separatorBuilder: (context, index) =>
                                  verticalSpace(10),
                              itemCount: cubit.complains.length,
                              itemBuilder: (context, index) {
                                return RoundedMessageCard(
                                  message:
                                      cubit.complains[index].messageDetail!,
                                  sender: cubit.complains[index].contactEmail!,
                                );
                              }))
                      : Container(
                          color: Colors.white,
                          child: Padding(
                              padding: EdgeInsets.only(
                                  top: 20.h, left: 20.w, right: 20.w),
                              child: Column(
                                children: [
                                  LottieBuilder.asset(
                                      "assets/animations/no items found.json"),
                                  verticalSpace(80),
                                  Text(
                                    S.of(context).noComplains,
                                    style: TextStyles.lightHeadings,
                                  ),
                                ],
                              )),
                        ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: ColorManager.primary100,
                onPressed: () {
                  context.pushNamed(Routes.addComplain);
                },
                child: const Icon(
                  Icons.add,
                  color: ColorManager.white,
                ),
              ));
        },
      ),
    );
  }
}
