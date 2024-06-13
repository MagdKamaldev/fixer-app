import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/features/home/presentation/profile_view/presentation/views/widgets/profile_info_row_model.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.w,
      height: 336.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: ColorManager.primary100,width: 1)
      ),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ProlifeInfoRowModel(labeltext: S.of(context).name, labelInfo: "Nadine", icon: Icons.perm_identity),
          ProlifeInfoRowModel(labeltext: S.of(context).phone, labelInfo: "010000000000", icon: Icons.phone_outlined),
          ProlifeInfoRowModel(labeltext: S.of(context).email, labelInfo: "BBBBB@gmail.com", icon: Icons.email_outlined),
          ProlifeInfoRowModel(labeltext: S.of(context).field, labelInfo: "pluming", icon: Icons.category_outlined),

        ],
      ),
    );
  }
}