import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/core/widgets/buttons/default_button.dart';
import 'package:fixer/features/craftsman_sign_up/manager/craftsman_sign_up_cubit/craftsman_sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../../generated/l10n.dart';

class UploadPhotosBody extends StatelessWidget {
  const UploadPhotosBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CraftsmanSignUpCubit(),
      child: BlocConsumer<CraftsmanSignUpCubit, CraftsmanSignUpState>(
        listener: (context, state) {},
        builder: (context, state) {
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
                      child: Image.asset("assets/images/id.png")),
                  verticalSpace(100),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: DefaultButton(
                        text: S.of(context).upload,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext dialogContext) {
                              return AlertDialog(
                                title: Text(
                                  S.of(context).uploadOptions,
                                  style: TextStyles.bodybold,
                                ),
                                content: SingleChildScrollView(
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        child: Column(
                                          children: [
                                            verticalSpace(30),
                                            Text(
                                              S.of(context).camera,
                                              style: TextStyles.headings,
                                            ),
                                            verticalSpace(10),
                                            SizedBox(
                                                height: 80.h,
                                                width: 80.w,
                                                child: Image.asset(
                                                    "assets/images/camera.png")),
                                          ],
                                        ),
                                        onTap: () {
                                          // Handle camera upload
                                          CraftsmanSignUpCubit.get(context)
                                              .getStoryImagefromCamera(context);
                                        },
                                      ),
                                      horizontalSpace(50),
                                      GestureDetector(
                                        child: Column(
                                          children: [
                                            verticalSpace(30),
                                            Text(
                                              S.of(context).gallery,
                                              style: TextStyles.headings,
                                            ),
                                            verticalSpace(10),
                                            SizedBox(
                                                height: 80.h,
                                                width: 80.w,
                                                child: Image.asset(
                                                    "assets/images/gallery.png")),
                                          ],
                                        ),
                                        onTap: () {
                                          CraftsmanSignUpCubit.get(context)
                                              .getStoryImagefromGallery(
                                                  context);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }),
                  ),
                  if (CraftsmanSignUpCubit.get(context).storyImage != null)
                    Container(
                      height: 340,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          image: DecorationImage(
                            image: FileImage(
                              CraftsmanSignUpCubit.get(context).storyImage!,
                            ),
                            fit: BoxFit.cover,
                          )),
                    ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
