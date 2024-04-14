import 'package:fixer/core/widgets/routing/routes.dart';
import 'package:fixer/features/confirmation_code/presentation/views/confimation_code_View.dart';
import 'package:fixer/features/craftsman_signup/presentation/views/craftsman_signup_view.dart';
import 'package:fixer/features/fields_of_service/fields_view.dart';
import 'package:fixer/features/get_started/presentation/views/get_started_view.dart';
import 'package:fixer/features/login/presentation/views/login_view.dart';
import 'package:fixer/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:fixer/features/password/presentation/views/password_view.dart';
import 'package:fixer/features/phone_number/presentation/views/phone_number_view.dart';
import 'package:fixer/features/user_signup/presentation/views/user_signup_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    //final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(
          builder: (_) => const OnboardingView(),
        );
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => const LoginView(),
        );
      case Routes.getStarted:
        return MaterialPageRoute(
          builder: (_) => const GetStartedView(),
        );
      case Routes.userSignUp:
        return MaterialPageRoute(
          builder: (_) => const UserSignUpView(),
        );
      case Routes.phoneNumber:
        return MaterialPageRoute(
          builder: (_) => const PhoneNumberView(),
        );
      case Routes.password:
        return MaterialPageRoute(
          builder: (_) => const PasswordView(),
        );  
      case Routes.confirmationCode:
        return MaterialPageRoute(
          builder: (_) => const ConfirmationCodeView(),
        );
      case Routes.craftsmanSignUp:
        return MaterialPageRoute(
          builder: (_) => const CraftsmanSignUpView(),
        );
      case Routes.fieldOfService:
        return MaterialPageRoute(
          builder: (_) => const FieldOfService(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
