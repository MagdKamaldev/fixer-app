import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/features/home/presentation/profile_view/presentation/views/widgets/profile_info.dart';
import 'package:fixer/features/home/presentation/profile_view/presentation/views/widgets/stack_container.dart';
import 'package:flutter/material.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const StackConatiner(),
        verticalSpace(15),
        Text("user name",style: TextStyles.subHeadings.copyWith(color: ColorManager.primary),),
        verticalSpace(15),
        const ProfileInfo(),
      ],
    );
  }
}