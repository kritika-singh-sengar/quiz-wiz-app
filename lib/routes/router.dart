import 'package:flutter/material.dart';
import 'package:quiz_wiz/bloc/auth/auth_state.dart';
import 'package:quiz_wiz/constants/routes_constant.dart';
import 'package:quiz_wiz/enums/auth_status_enum.dart';
import 'package:quiz_wiz/models/quiz_model.dart';
import 'package:quiz_wiz/screens/auth/login_screen.dart';
import 'package:quiz_wiz/screens/auth/signup_screen.dart';
import 'package:quiz_wiz/screens/dashboard/dashboard_screen.dart';
import 'package:quiz_wiz/screens/dashboard/quiz/quiz_screen.dart';
import 'package:quiz_wiz/screens/shared/error_screen.dart';

class AppRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final param = settings.arguments;

    switch (settings.name) {
      case AppUrls.mainDashboard:
        return MaterialPageRoute(builder: (_) => const Dashboard());

      case AppUrls.login:
        return MaterialPageRoute(builder: (_) => const Login());

      case AppUrls.signup:
        return MaterialPageRoute(builder: (_) => const SignUp());

      case AppUrls.quiz:
        if (param is Quiz) {
          return MaterialPageRoute(builder: (_) => QuizScreen(quiz: param));
        } else {
          return MaterialPageRoute(
              builder: (_) =>
                  const ErrorScreen(errorMessage: 'Something Went Wrong'));
        }

      case AppUrls.error:
        return MaterialPageRoute(
            builder: (_) =>
                const ErrorScreen(errorMessage: 'Something Went Wrong'));

      default:
        return MaterialPageRoute(
            builder: (_) => const ErrorScreen(errorMessage: 'Page Not Found'));
    }
  }

  // static Route<dynamic> onGenerateAppViewPage(AuthStatus authStatus) {
  //   switch (authStatus) {
  //     case AuthStatus.authenticated:
  //       return MaterialPageRoute(builder: (_) => const Dashboard());
  //     case AuthStatus.unauthenticated:
  //       return MaterialPageRoute(builder: (_) => const Login());
  //     default:
  //       return MaterialPageRoute(
  //           builder: (_) => const ErrorScreen(errorMessage: 'Page Not Found'));
  //   }
  // }
}
