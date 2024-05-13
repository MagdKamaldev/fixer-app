// ignore_for_file: library_private_types_in_public_api

import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/core/widgets/buttons/default_button.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class SelectLoations extends StatefulWidget {
  const SelectLoations({super.key});

  @override
  _SelectLoationsState createState() => _SelectLoationsState();
}

class _SelectLoationsState extends State<SelectLoations> {
  List<dynamic> selectedOptions = [];

  final List<dynamic> options = [
    'Option 1',
    'Option 2',
    'Option 3',
    'Option 4',
    'Option 5',
    'Option 1',
    'Option 2',
    'Option 3',
    'Option 4',
    'Option 5',
    'Option 1',
    'Option 2',
    'Option 3',
    'Option 4',
    'Option 5',
    'Option 1',
    'Option 2',
    'Option 3',
    'Option 4',
    'Option 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(16.sp),
        child: Column(
          children: [
            MultiSelectDialogField(
              searchable: true,
              items: options
                  .map((option) => MultiSelectItem<String>(option, option))
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
            DefaultButton(text: S.of(context).confirm, onPressed: () {}),
            verticalSpace(30)
          ],
        ),
      ),
    );
  }
}
