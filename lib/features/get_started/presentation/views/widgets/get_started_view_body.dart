import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/features/get_started/presentation/views/widgets/get_started_body_buttons.dart';
import 'package:fixer/features/get_started/presentation/views/widgets/get_started_view_upperbody.dart';
import 'package:flutter/material.dart';

class GetStartedBody extends StatelessWidget {
  const GetStartedBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView(children: [
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const UpperBody(),
            verticalSpace(35),
            const StartButtons()
          ]),
        ]));
  }
}
