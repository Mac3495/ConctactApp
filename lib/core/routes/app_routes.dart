import 'package:contact_app/ui/screens/auth/login/login_screen.dart';
import 'package:contact_app/ui/screens/auth/sign_up/sign_up_screen.dart';
import 'package:contact_app/ui/screens/home/contact_page/add_contact/add_contact_screen.dart';
import 'package:contact_app/ui/screens/home/home_screen.dart';
import 'package:contact_app/ui/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginScreen.route:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case SignUpScreen.route:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case HomeScreen.route:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case AddContactScreen.route:
        return MaterialPageRoute(builder: (_) => const AddContactScreen());
      default:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const SplashScreen());
    }
  }
}
