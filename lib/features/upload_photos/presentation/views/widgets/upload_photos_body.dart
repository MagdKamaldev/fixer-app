import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/features/upload_photos/presentation/views/widgets/upload_container_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../generated/l10n.dart';

class UploadPhotosBody extends StatelessWidget {
  const UploadPhotosBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            SizedBox(
              child: SvgPicture.asset('assets/images/fixrpic.svg',
                  width: 134.85.w, height: 91.h),
            ),
            verticalSpace(20),
            UploadConatiner(text: S.of(context).uploadid),
            UploadConatiner(text: S.of(context).uploadphoto),
          ],
        )
      ],
    );
  }
}
