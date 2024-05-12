import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:fixer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class MultiSelectWidget extends StatefulWidget {
  @override
  _MultiSelectWidgetState createState() => _MultiSelectWidgetState();
}

class _MultiSelectWidgetState extends State<MultiSelectWidget> {
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
    return Padding(
      padding: EdgeInsets.all(16.sp),
      child: Column(
        children: [
          MultiSelectDialogField(
            searchable: true,
            items: options
                .map((option) => MultiSelectItem<String>(option, option))
                .toList(),
            initialValue: selectedOptions,
            listType: MultiSelectListType.LIST,
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
        ],
      ),
    );
  }
}
