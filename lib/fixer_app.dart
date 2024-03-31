import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/widgets/routing/app_router.dart';
import 'package:fixer/core/widgets/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FixerApp extends StatelessWidget {
  final AppRouter appRouter;
  const FixerApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        title: 'Fixer',
        theme: ThemeData(
          primaryColor: ColorManager.primary,
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRoute,
        initialRoute: Routes.onBoarding,
      ),
    );
  }
}
