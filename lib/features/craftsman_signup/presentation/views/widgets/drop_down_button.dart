/*import 'package:fixer/core/helpers/spacing.dart';
import 'package:fixer/features/craftsman_signup/widgets/craftsman_signup_textform.dart';
import 'package:fixer/features/craftsman_signup/widgets/craftsman_signup_viewbody.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CityDropdown extends StatefulWidget {
  @override
  _CityDropdownState createState() => _CityDropdownState();
}

class _CityDropdownState extends State<CityDropdown> {
  String? selectedCity;
  final List<String> cities = ['Cairo', 'Alexandria'];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CraftsmanSignUpTextForm(
            controller: CraftsmanSignUpViewBody.cityController,
            text: "City",
            textInputType: TextInputType.name),
        verticalSpace(16),
        Padding(
          padding: EdgeInsets.only(left: 180.w),
          child: DropdownButton<String>(
            value: selectedCity,
            onChanged: (String? newValue) {
              setState(() {
                selectedCity = newValue;
              });
            },
            items: cities.map((String city) {
              return DropdownMenuItem<String>(
                value: city,
                child: Text(city),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}*/
