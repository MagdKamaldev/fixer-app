import 'package:fixer/core/routing/routes.dart';
import 'package:fixer/features/craftsman_sign_up/presentation/craftsman_confirmation_code/presentation/views/craftsman_confimation_code_view.dart';
import 'package:fixer/features/user_sign_up/presentation/user_confirmation_code/presentation/views/user_confimation_code_view.dart';
import 'package:fixer/features/craftsman_sign_up/presentation/views/craftsman_signup_view.dart';
import 'package:fixer/features/craftsman_sign_up/presentation/fields_of_service/fields_view.dart';
import 'package:fixer/features/get_started/presentation/views/get_started_view.dart';
import 'package:fixer/features/login/presentation/views/login_view.dart';
import 'package:fixer/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:fixer/features/craftsman_sign_up/presentation/password/presentation/views/password_view.dart';
import 'package:fixer/features/craftsman_sign_up/presentation/craftsman_phone_number/presentation/views/craftsman_phone_number_view.dart';
import 'package:fixer/features/reset_password/presentation/reset_password_view.dart';
import 'package:fixer/features/craftsman_sign_up/presentation/upload_photos/presentation/views/upload_photos_view.dart';
import 'package:fixer/features/user_sign_up/presentation/user_signup_layout/presentation/views/user_signup_layout_view.dart';
import 'package:flutter/material.dart';

import '../../features/forgot_password/presentation/forget_password_view.dart';

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
      case Routes.craftsmanPhoneNumber:
        return MaterialPageRoute(
          builder: (_) => const CraftsmanPhoneNumberView(),
        );
      case Routes.password:
        return MaterialPageRoute(
          builder: (_) => const PasswordView(),
        );
      case Routes.craftsmanConfirmationCode:
        return MaterialPageRoute(
          builder: (_) => const CraftsmanConfirmationCodeView(),
        );
      case Routes.userConfirmationCode:
        return MaterialPageRoute(
          builder: (_) => const UserConfirmationCodeView(),
        );
      case Routes.craftsmanSignUp:
        return MaterialPageRoute(
          builder: (_) => const CraftsmanSignUpView(),
        );
      case Routes.fieldOfService:
        return MaterialPageRoute(
          builder: (_) => const FieldOfService(),
        );
      case Routes.uploadPhotos:
        return MaterialPageRoute(
          builder: (_) => const UploadPhotosView(),
        );
      case Routes.forgetPassword:
        return MaterialPageRoute(
          builder: (_) => const ForgetPassword(),
        );
      case Routes.resetPassword:
        return MaterialPageRoute(
          builder: (_) => const ResetPassword(),
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