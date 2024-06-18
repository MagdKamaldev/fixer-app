import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/features/services/presentation/view/widgets/services_wrap_row.dart';
import 'package:fixer/features/stores/presentation/views/widgets/searchbar_container.dart';
import 'package:flutter/material.dart';

class ServicesBody extends StatelessWidget {
  const ServicesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only( left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SearchbarContainer(),
            verticalSpace(24),
            ServicesWrapRow(),

            

          ],
        ),
      );
  }
}