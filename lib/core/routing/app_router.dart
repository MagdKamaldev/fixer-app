import 'package:fixer/core/routing/routes.dart';
import 'package:fixer/features/complains/presentation/add_complain_view.dart';
import 'package:fixer/features/complains/presentation/complains_view.dart';
import 'package:fixer/features/craftsman_sign_up/presentation/craftsmen_upload_image/upload_image_screen.dart';
import 'package:fixer/features/home/presentation/views/home_view.dart';
import 'package:fixer/features/payment/presentation/payment_view.dart';
import 'package:fixer/features/requests/presentation/views/widgets/available_craftmen.dart';
import 'package:fixer/features/requests/presentation/views/widgets/confirm_location.dart';
import 'package:fixer/features/stores/presentation/views/stores_viewall.dart';
import 'package:fixer/features/user_sign_up/presentation/user_signup_layout/presentation/views/widgets/set_user_location.dart';
import 'package:fixer/features/craftsman_sign_up/presentation/views/craftsman_signup_view.dart';
import 'package:fixer/features/get_started/presentation/views/get_started_view.dart';
import 'package:fixer/features/login/presentation/views/login_view.dart';
import 'package:fixer/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:fixer/features/craftsman_sign_up/presentation/password/presentation/views/password_view.dart';
import 'package:fixer/features/craftsman_sign_up/presentation/craftsman_phone_number/presentation/views/craftsman_phone_number_view.dart';
import 'package:fixer/features/reset_password/presentation/reset_password_view.dart';
import 'package:fixer/features/craftsman_sign_up/presentation/upload_photos/presentation/views/upload_photos_view.dart';
import 'package:fixer/features/user_sign_up/presentation/user_signup_layout/presentation/views/user_signup_layout_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../features/forgot_password/presentation/forget_password_view.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
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
      case Routes.craftsmanSignUp:
        return MaterialPageRoute(
          builder: (_) => const CraftsmanSignUpView(),
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
      case Routes.setUserLocation:
        return MaterialPageRoute(
          builder: (_) => const SetUserLocation(),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
        );
      case Routes.storesviewAll:
        return MaterialPageRoute(
          builder: (_) => const StoresviewAll(),
        );
      case Routes.craftsmanUploadImage:
        return MaterialPageRoute(
          builder: (_) => const CraftsmanProfileScreen(),
        );
      case Routes.complains:
        return MaterialPageRoute(
          builder: (_) => const ComplainsView(),
        );
      case Routes.addComplain:
        return MaterialPageRoute(
          builder: (_) => const AddComplain(),
        );
      case Routes.payment:
        return MaterialPageRoute(
          builder: (_) => const PaymentView(),
        );
        // case Routes.services:
        // return MaterialPageRoute(
        //   builder: (_) => const ServicesView(),
        // );
        // case Routes.request:
        // return MaterialPageRoute(
        //   builder: (_) => const RequestView(),
        // );
        case Routes.confirmlocation:
        return MaterialPageRoute(
          builder: (_) => const ConfirmLocation(),
        );
        case Routes.availablecraftmen:
        return MaterialPageRoute(
          builder: (_) => const AvailableCraftmen(),
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

void navigateTo(context, widget) => Navigator.push(
    context,
    CupertinoPageRoute(
      builder: (context) => widget,
    ));

void navigateAndFinish(context, widget) => Navigator.pushReplacement(
    context,
    CupertinoPageRoute(
      builder: (context) => widget,
    ));
