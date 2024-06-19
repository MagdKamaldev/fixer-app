import 'package:fixer/core/helpers/extensions.dart';
import 'package:fixer/core/routing/app_router.dart';
import 'package:fixer/core/routing/routes.dart';
import 'package:fixer/core/service_locator/service_locator.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/features/requests/presentation/views/widgets/cancel_request_bottom_sheet.dart';
import 'package:fixer/features/requests/presentation/views/widgets/request_row_model.dart';
import 'package:fixer/features/requests/presentation/views/widgets/requested_services_bottom_sheet.dart';
import 'package:fixer/features/services/data/reepos/services_repo_impl.dart';
import 'package:fixer/features/services/manager/cubit/services_cubit.dart';
import 'package:fixer/features/services/presentation/view/services_view.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmRequestContainer extends StatelessWidget {
  final int id;
  const ConfirmRequestContainer({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RequestRowModel(
                icon: Icons.location_on_outlined,
                label: S.of(context).area,
                description: "tagamo3"),
            InkWell(
                onTap: () {
                  context.pushNamed(Routes.confirmlocation);
                },
                child: Text(
                  S.of(context).change,
                  style: TextStyles.body.copyWith(color: ColorManager.primary),
                ))
          ],
        ),
        BlocProvider(
          create: (context) => ServicesCubit(getIt<ServicesRepoImpl>()),
          child: BlocBuilder<ServicesCubit, ServicesState>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          return const RequestedServicesBottomSheet();
                        },
                      );
                    },
                    child: RequestRowModel(
                      icon: Icons.category_outlined,
                      label: S.of(context).service,
                      description: selected.first.name!,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      navigateTo(
                        context,
                        ServicesView(
                          id: id,
                          category: id == 14 ? "Plumbing" : "Electric",
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.add,
                      color: ColorManager.primary,
                      size: 25,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        RequestRowModel(
          icon: Icons.price_change_outlined,
          label: S.of(context).price,
          description: "${selected.first.price} LE",
        ),
        MaterialButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return const CancelRequestBottomSheet();
              },
            );
          },
          color: ColorManager.primary,
          height: 50.h,
          minWidth: 330.w,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            S.of(context).confirmrequest,
            style: TextStyles.body.copyWith(color: ColorManager.white),
          ),
        ),
      ],
    );
  }
}
