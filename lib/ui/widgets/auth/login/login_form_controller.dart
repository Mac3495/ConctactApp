import 'package:flutter/material.dart';

class LoginFormController extends ChangeNotifier {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordVisible = false;

  changePasswordVisible() {
    passwordVisible = !passwordVisible;
    notifyListeners();
  }
}