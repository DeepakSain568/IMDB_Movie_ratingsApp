import 'package:http_amdb/MVVM/utils/routes/routes_names.dart';
import 'package:http_amdb/MVVM/view/home_screen.dart';
import 'package:http_amdb/MVVM/view/login_screen.dart';
import 'package:http_amdb/MVVM/view/signup_screen.dart';
import 'package:http_amdb/MVVM/view/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.Login:
        return MaterialPageRoute(
          builder: (context) {
            return const LoginScreen();
          },
        );

        case RoutesName.splash:
        return MaterialPageRoute(
          builder: (context) {
            return const SplashScreen();
          },
        );

      case RoutesName.home:
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return const HomeScreen();
          },
        );

      case RoutesName.signup:
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return const SignupScreen();
          },
        );

      default:
        return MaterialPageRoute(builder: (BuildContext context) {
          return Scaffold(
            body: Center(child: Text('error Loading Page')),
          );
        });
    }
  }
}
