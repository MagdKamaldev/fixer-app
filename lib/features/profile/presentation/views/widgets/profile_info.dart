import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/features/profile/data/models/profile_model.dart';
import 'package:fixer/features/profile/presentation/views/widgets/profile_info_row_model.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileInfo extends StatelessWidget {
  final ProfileModel user;
  const ProfileInfo({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.w,
      height: 336.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: ColorManager.grey, width: 1)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ProlifeInfoRowModel(
              labeltext: S.of(context).name,
              labelInfo: user.name ?? "N/A",
              icon: Icons.perm_identity),
          ProlifeInfoRowModel(
              labeltext: S.of(context).phone,
              labelInfo: user.phone ?? "N/A",
              icon: Icons.phone_outlined),
          ProlifeInfoRowModel(
              labeltext: S.of(context).email,
              labelInfo: user.email ?? "N/A",
              icon: Icons.email_outlined),
          ProlifeInfoRowModel(
              labeltext: S.of(context).field,
              labelInfo: user.userType ?? "N/A",
              icon: Icons.category_outlined),
        ],
      ),
    );
  }
}
