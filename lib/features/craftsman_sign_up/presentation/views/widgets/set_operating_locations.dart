// ignore_for_file: library_private_types_in_public_api

import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/service_locator/service_locator.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/core/widgets/buttons/default_button.dart';
import 'package:fixer/features/craftsman_sign_up/data/repos/craftsman_signup_repo_implementation.dart';
import 'package:fixer/features/craftsman_sign_up/manager/craftsman_sign_up_cubit/craftsman_sign_up_cubit.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class SelectLoations extends StatefulWidget {
  const SelectLoations({super.key});

  @override
  _SelectLoationsState createState() => _SelectLoationsState();
}

class _SelectLoationsState extends State<SelectLoations> {
  List<dynamic> selectedOptions = [];

  List<dynamic> options = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CraftsmanSignUpCubit(getIt<CraftsmanSignUpRepositoryImplementation>())
            ..getLocations(),
      child: BlocConsumer<CraftsmanSignUpCubit, CraftsmanSignUpState>(
        listener: (context, state) {
          if (state is GetlocationsSuccess) {
            options = state.locations.map((e) => e.name).toList();
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: EdgeInsets.all(16.sp),
              child: state is GetlocationsSuccess
                  ? Column(
                      children: [
                        MultiSelectDialogField(
                          searchable: true,
                          items: options
                              .map((option) =>
                                  MultiSelectItem<String>(option, option))
                              .toList(),
                          initialValue: selectedOptions,
                          listType: MultiSelectListType.CHIP,
                          onConfirm: (List<dynamic> values) {
                            setState(() {
                              selectedOptions = values;
                            });
                          },
                          chipDisplay: MultiSelectChipDisplay(
                            chipColor: ColorManager.primary100,
                            textStyle: TextStyles.body,
                          ),
                          title: Text(
                            S.of(context).selectArea,
                            style: TextStyles.bodybold,
                          ),
                        ),
                        const Spacer(),
                        DefaultButton(
                            text: S.of(context).confirm, onPressed: () {}),
                        verticalSpace(30)
                      ],
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
          );
        },
      ),
    );
  }
}
