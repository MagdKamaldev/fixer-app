import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/service_locator/service_locator.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/features/craftsman_sign_up/data/models/craftsman_model.dart';
import 'package:fixer/features/craftsman_sign_up/data/repos/craftsman_signup_repo_implementation.dart';
import 'package:fixer/features/craftsman_sign_up/manager/craftsman_sign_up_cubit/craftsman_sign_up_cubit.dart';
import 'package:fixer/features/craftsman_sign_up/presentation/craftsman_phone_number/presentation/views/widgets/phone_number_body.dart';
import 'package:fixer/features/craftsman_sign_up/presentation/password/presentation/views/widgets/password_body.dart';
import 'package:fixer/features/login/presentation/views/widgets/login_view_body_logo.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class FieldOfServiceBody extends StatelessWidget {
  final String name;
  final String userName;
  final String email;
  const FieldOfServiceBody(
      {super.key,
      required this.name,
      required this.userName,
      required this.email});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CraftsmanSignUpCubit(
          getIt<CraftsmanSignUpRepositoryImplementation>()),
      child: BlocConsumer<CraftsmanSignUpCubit, CraftsmanSignUpState>(
          listener: (context, state) {},
          builder: (context, state) {
            CraftsmanSignUpCubit cubit = CraftsmanSignUpCubit.get(context);
            if (state is! RegisterCraftsmanLoading) {
              return Center(
                child: Column(children: [
                  verticalSpace(5),
                  const Logo(),
                  verticalSpace(30),
                  Text(
                    S.of(context).chooseyourfield,
                    style: TextStyles.subHeadingsBold,
                  ),
                  verticalSpace(30),
                  GestureDetector(
                      onTap: () {
                        cubit.registerCraftsman(
                            CraftsmanModel(
                              name: name,
                              email: email,
                              username: userName,
                              password: craftsmanPassword,
                              phone: craftsmanPhoneNumber,
                              userType: "craftsman",
                              categoryName: "electrical",
                            ),
                            context);
                      },
                      child: SvgPicture.asset(
                        "assets/images/Electrical_card.svg",
                        height: 180.h,
                        width: 150.w,
                      )),
                  verticalSpace(40),
                  GestureDetector(
                      onTap: () {
                        cubit.registerCraftsman(
                            CraftsmanModel(
                              name: name,
                              email: email,
                              username: userName,
                              password: craftsmanPassword,
                              phone: craftsmanPhoneNumber,
                              userType: "craftsman",
                              categoryName: "plumbing",
                            ),
                            context);
                      },
                      child: SvgPicture.asset(
                        "assets/images/plumbing_card.svg",
                        height: 180.h,
                        width: 150.w,
                      ))
                ]),
              );
            }
            return Center(
                child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    width: MediaQuery.of(context).size.width,
                    child: Lottie.asset("assets/animations/loading.json")));
          }),
    );
  }
}
