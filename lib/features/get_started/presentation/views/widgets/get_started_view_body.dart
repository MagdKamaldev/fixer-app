import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/features/get_started/presentation/views/widgets/get_started_body_buttons.dart';
import 'package:fixer/features/get_started/presentation/views/widgets/get_started_view_upperbody.dart';
import 'package:flutter/material.dart';

class GetStartedBody extends StatelessWidget {
  const GetStartedBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(30),
          child: AppBar(),
        ),
        body: ListView(children: [
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            // verticalSpace(195),
            // horizontalSpace(62),
            const UpperBody(),
            verticalSpace(35),
            const StartButtons()
          ]),
        ]));
  }
}
