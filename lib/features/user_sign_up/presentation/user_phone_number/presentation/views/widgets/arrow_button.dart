// import 'package:fixer/core/helpers/extensions.dart';
// import 'package:fixer/core/themes/colors.dart';
// import 'package:fixer/core/widgets/routing/routes.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class ArrowButton extends StatelessWidget {
//   final PageController? controller;
//   const ArrowButton({super.key, this.controller});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         controller!.nextPage(
//                 duration: const Duration(microseconds: 500),
//                 curve: Curves.easeIn);
//       },
//       child: Container(
//           margin: EdgeInsets.symmetric(horizontal: 20.w),
//           width: 71.w,
//           height: 71.h,
//           decoration: const BoxDecoration(
//             shape: BoxShape.circle,
//             color: ColorManager.primary,
//           ),
//           child: Icon(
//             Icons.arrow_forward,
//             color: ColorManager.white,
//             size: 30.w,
//           )),
//     );
//   }
// }
