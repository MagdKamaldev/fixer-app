import 'package:firebase_core/firebase_core.dart';
import 'package:fixer/core/widgets/routing/app_router.dart';
import 'package:fixer/firebase_options.dart';
import 'package:fixer/fixer_app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(FixerApp(
    appRouter: AppRouter(),
  ));
}
