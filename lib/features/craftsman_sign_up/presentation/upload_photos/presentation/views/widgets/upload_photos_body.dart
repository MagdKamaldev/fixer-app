import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/core/widgets/buttons/default_button.dart';
import 'package:fixer/features/craftsman_sign_up/manager/craftsman_sign_up_cubit/craftsman_sign_up_cubit.dart';
import 'package:fixer/features/craftsman_sign_up/presentation/upload_photos/presentation/views/widgets/back_id.dart';
import 'package:fixer/features/craftsman_sign_up/presentation/upload_photos/presentation/views/widgets/front_id.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
                    padding: EdgeInsets.all(20.w),
                    child: const Row(
                      children: [
                        FrontId(),
                        Spacer(),
                        BackId(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.w),
                    child: Row(
                      children: [
                        if (CraftsmanSignUpCubit.get(context).frontImage !=
                            null)
                          Container(
                            height: 100.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                image: DecorationImage(
                                  image: FileImage(
                                    CraftsmanSignUpCubit.get(context)
                                        .frontImage!,
                                  ),
                                  fit: BoxFit.cover,
                                )),
                          ),
                        const Spacer(),
                        if (CraftsmanSignUpCubit.get(context).backImage != null)
                          Container(
                            height: 100.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                image: DecorationImage(
                                  image: FileImage(
                                    CraftsmanSignUpCubit.get(context)
                                        .backImage!,
                                  ),
                                  fit: BoxFit.cover,
                                )),
                          ),
                      ],
                    ),
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
