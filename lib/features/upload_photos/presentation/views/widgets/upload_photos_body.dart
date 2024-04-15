import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/features/upload_photos/presentation/views/widgets/upload_container_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

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
                  width: 134.85, height: 91),
            ),
            verticalSpace(20),
            const UploadConatiner(text: "Upload your national ID"),
             verticalSpace(20),
            const UploadConatiner(text: "Upload your profile photo"),
            
          ],
        )
      ],
    );
  }
}