import 'package:fixer/core/helpers/extensions.dart';
import 'package:fixer/core/widgets/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CraftsmanTextFieldModel extends StatelessWidget {
  final bool? lastTextField;
  final String? routeName;
  const CraftsmanTextFieldModel({super.key,this.lastTextField, this.routeName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60.w,
      height: 60.h,
      child: TextFormField(
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
          if(value.isEmpty){
            FocusScope.of(context).previousFocus();
          }
          if(lastTextField==true){
           context.pushNamed(Routes.password);
            
          }
        },
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.sp),
                borderSide: const BorderSide(width: 0.5))),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );


  }
}
