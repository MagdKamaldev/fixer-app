import 'package:firebase_core/firebase_core.dart';
import 'package:fixer/core/constants/constants.dart';
import 'package:fixer/core/keys/api_keys.dart';
import 'package:fixer/core/routing/app_router.dart';
import 'package:fixer/core/service_locator/service_locator.dart';
import 'package:fixer/firebase_options.dart';
import 'package:fixer/fixer_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:hive_flutter/hive_flutter.dart';

String? token = "";

void main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(kTokenBoxString);
  Stripe.publishableKey = ApiKeys.publicKey;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(FixerApp(
    appRouter: AppRouter(),
  ));
}
