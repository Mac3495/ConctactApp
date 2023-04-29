

import 'package:contact_app/core/routes/app_routes.dart';
import 'package:contact_app/core/utils/app_colors.dart';
import 'package:contact_app/core/utils/app_theme.dart';
import 'package:contact_app/ui/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final theme = AppTheme().theme;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SplashScreen.route,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme.copyWith(
        highlightColor: Colors.transparent,
        colorScheme: theme.colorScheme.copyWith(primary: AppColors.primary)
      ),
    );
  }
}