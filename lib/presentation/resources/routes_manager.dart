import 'package:advanced_flutter_arabic/app/di.dart';
import 'package:advanced_flutter_arabic/presentation/forgot_password/view/forgot_password_view.dart';
import 'package:advanced_flutter_arabic/presentation/login/view/login_view.dart';
import 'package:advanced_flutter_arabic/presentation/main/main_view.dart';
import 'package:advanced_flutter_arabic/presentation/onboarding/view/onboarding_view.dart';
import 'package:advanced_flutter_arabic/presentation/register/view/register_view.dart';
import 'package:advanced_flutter_arabic/presentation/resources/strings_manager.dart';
import 'package:advanced_flutter_arabic/presentation/splash/splash_view.dart';
import 'package:advanced_flutter_arabic/presentation/store_details/view/store_details_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
  static const String onBordingScreen = "/onBordingScreen";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.registerRoute:
        initRegesterModule();
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.onBordingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.forgotPasswordRoute:
        initForgetPasswordModule();
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case Routes.mainRoute:
        initHomeModule();
        return MaterialPageRoute(builder: (_) => const MainView());
      case Routes.storeDetailsRoute:
        initStoreDetailsModule();
        return MaterialPageRoute(builder: (_) => const StoreDetailsView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title:  Text(AppStrings.noRouteFound.tr()),
              ),
              body:  Center(child: Text(AppStrings.noRouteFound.tr())),
            ));
  }
}
