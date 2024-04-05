import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/features/get_started/presentation/views/widgets/get_started_body_buttons.dart';
import 'package:fixer/features/get_started/presentation/views/widgets/get_started_view_upperbody.dart';
import 'package:flutter/material.dart';

class GetStartedBody extends StatelessWidget {
  const GetStartedBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      verticalSpace(195),
      horizontalSpace(82),
      const UpperBody(),
      verticalSpace(70),
      const StartButtons()
    ]);
  }
}
