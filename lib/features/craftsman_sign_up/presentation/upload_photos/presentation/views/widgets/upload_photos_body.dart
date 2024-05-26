import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/service_locator/service_locator.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/core/widgets/buttons/default_button.dart';
import 'package:fixer/features/craftsman_sign_up/data/repos/craftsman_signup_repo_implementation.dart';
import 'package:fixer/features/craftsman_sign_up/manager/craftsman_sign_up_cubit/craftsman_sign_up_cubit.dart';
import 'package:fixer/features/craftsman_sign_up/presentation/upload_photos/presentation/views/widgets/back_id.dart';
import 'package:fixer/features/craftsman_sign_up/presentation/upload_photos/presentation/views/widgets/front_id.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import '../../../../../../../generated/l10n.dart';

class UploadPhotosBody extends StatelessWidget {
  const UploadPhotosBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CraftsmanSignUpCubit(
          getIt<CraftsmanSignUpRepositoryImplementation>()),
      child: BlocConsumer<CraftsmanSignUpCubit, CraftsmanSignUpState>(
        listener: (context, state) {},
        builder: (context, state) {
          CraftsmanSignUpCubit cubit = CraftsmanSignUpCubit.get(context);
          if (state is! CraftsManUploadPhotoLoading) {
            return ListView(
              children: [
                Column(
                  children: [
                    SizedBox(
                      child: SvgPicture.asset('assets/images/fixrpic.svg',
                          width: 134.85.w, height: 91.h),
                    ),
                    verticalSpace(50),
                    Text(
                      S.of(context).uploadid,
                      style: TextStyles.headings,
                    ),
                    verticalSpace(50),
                    SizedBox(
                        height: 100.h,
                        width: 100.w,
                        child: Image.asset("assets/images/upload.png")),
                    verticalSpace(50),
                    Padding(
                      padding: EdgeInsets.all(20.0.sp),
                      child: Card(
                        color: ColorManager.primary100,
                        elevation: 2,
                        child: Padding(
                          padding: EdgeInsets.all(35.sp),
                          child: Column(
                            children: [
                              const Row(
                                children: [
                                  FrontId(),
                                  Spacer(),
                                  BackId(),
                                ],
                              ),
                              if (cubit.frontImage != null ||
                                  cubit.backImage != null)
                                verticalSpace(20),
                              Row(
                                children: [
                                  if (cubit.frontImage == null)
                                    SizedBox(
                                        height: 50.h,
                                        width: 50.w,
                                        child: Image.asset(
                                            "assets/images/front.png")),
                                  if (cubit.frontImage != null)
                                    Container(
                                      height: 100.h,
                                      width: 120.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          image: DecorationImage(
                                            image: FileImage(
                                              cubit.frontImage!,
                                            ),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  const Spacer(),
                                  if (cubit.backImage == null)
                                    SizedBox(
                                        height: 50.h,
                                        width: 50.w,
                                        child: Image.asset(
                                            "assets/images/back.png")),
                                  if (cubit.backImage != null)
                                    Container(
                                      height: 100.h,
                                      width: 120.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          image: DecorationImage(
                                            image: FileImage(
                                              cubit.backImage!,
                                            ),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    verticalSpace(30),
                    if (state is! CraftsManUploadPhotoLoading)
                      Padding(
                        padding: EdgeInsets.all(20.0.sp),
                        child: DefaultButton(
                            text: S.of(context).upload,
                            onPressed: () {
                              cubit.uploadFrontImage(context);
                            }),
                      ),
                    if (state is CraftsManUploadPhotoLoading)
                      const Center(child: CircularProgressIndicator()),
                    verticalSpace(30),
                  ],
                )
              ],
            );
          } else {
            return Padding(
              padding: EdgeInsets.all(20.sp),
              child: Column(
                children: [
                  LottieBuilder.asset("assets/animations/uploading.json"),
                  verticalSpace(50),
                  Text(
                    S.of(context).uploading,
                    style: TextStyles.headings,
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
