import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/service_locator/service_locator.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/features/profile/data/models/profile_model.dart';
import 'package:fixer/features/profile/data/repos/profile_repo_impl.dart';
import 'package:fixer/features/profile/manager/cubit/profile_cubit.dart';
import 'package:fixer/features/profile/presentation/views/widgets/profile_info.dart';
import 'package:fixer/features/profile/presentation/views/widgets/profile_stack_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(getIt<ProfileRepoImpl>())..getProfile(),
      child: BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
        if (ProfileCubit.get(context).user == null) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const ProfileStackConatiner(
                image: "",
              ),
              verticalSpace(15),
              Text(
                "user name",
                style: TextStyles.subHeadings
                    .copyWith(color: ColorManager.primary),
              ),
              verticalSpace(15),
              ProfileInfo(
                user: ProfileModel(
                  name: "John Doe",
                  email: "JohnDoe@gmail.com",
                  phone: "+201234567890",
                  userType: "User",
                ),
              ),
            ],
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProfileStackConatiner(
                image: ProfileCubit.get(context).user!.profilePic!,
              ),
              verticalSpace(15),
              Text(
                ProfileCubit.get(context).user!.name!,
                style: TextStyles.subHeadings
                    .copyWith(color: ColorManager.primary),
              ),
              verticalSpace(15),
              ProfileInfo(
                user: ProfileCubit.get(context).user!,
              ),
            ],
          );
        }
      }),
    );
  }
}