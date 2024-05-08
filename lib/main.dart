import 'package:firebase_core/firebase_core.dart';
import 'package:fixer/core/routing/app_router.dart';
import 'package:fixer/core/service_locator/service_locator.dart';
import 'package:fixer/firebase_options.dart';
import 'package:fixer/fixer_app.dart';
import 'package:flutter/material.dart';

String? token = "";
void main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(FixerApp(
    appRouter: AppRouter(),
  ));
}
