import 'package:flutter/material.dart';

class SignUpFormController extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool passwordVisible = false;
  bool confirmPasswordVisible = false;

  changePasswordVisible() {
    passwordVisible = !passwordVisible;
    notifyListeners();
  }

  changeConfirmPasswordVisible() {
    confirmPasswordVisible = !confirmPasswordVisible;
    notifyListeners();
  }
}