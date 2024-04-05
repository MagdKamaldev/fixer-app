import 'package:fixer/core/constants/constants.dart';
import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/widgets/routing/app_router.dart';
import 'package:fixer/core/widgets/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

class FixerApp extends StatelessWidget {
  final AppRouter appRouter;
  const FixerApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        locale: const Locale(locale),
        title: 'Fixer',
        theme: ThemeData(
          primaryColor: ColorManager.primary,
        ),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRoute,
        initialRoute: Routes.onBoarding,
      ),
    );
  }
}
