import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/routing/app_router.dart';
import 'package:fixer/core/service_locator/service_locator.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/features/requests/presentation/views/requests_views.dart';
import 'package:fixer/features/services/data/models/service_model.dart';
import 'package:fixer/features/services/data/reepos/services_repo_impl.dart';
import 'package:fixer/features/services/manager/cubit/services_cubit.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopUpMessage extends StatefulWidget {
  final int id;
  final ServiceModel service;

  const PopUpMessage({super.key, required this.id, required this.service});

  @override
  State<PopUpMessage> createState() => _PopUpMessageState();
}

class _PopUpMessageState extends State<PopUpMessage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServicesCubit(getIt<ServicesRepoImpl>()),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 0.0,
        insetPadding: const EdgeInsets.all(24),
        backgroundColor: Colors.transparent,
        child: BlocBuilder<ServicesCubit, ServicesState>(
          builder: (context, state) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
              ),
              width: 350.w,
              height: 180.h,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.close,
                          size: 20,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                  Text(
                    "${S.of(context).doyouwanttorequestservice} \n ${widget.service.name!}?",
                    style: TextStyles.small,
                    textAlign: TextAlign.center,
                  ),
                  verticalSpace(20),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        selected.add(widget.service);
                      });

                      if (selected.isNotEmpty) {
                        navigateTo(
                          context,
                          RequestView(
                            id: widget.id,
                          ),
                        );
                      }
                    },
                    color: ColorManager.primary,
                    height: 40,
                    minWidth: 110,
                    textColor: ColorManager.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(S.of(context).requestnow),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
