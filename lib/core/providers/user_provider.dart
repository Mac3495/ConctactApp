import 'package:contact_app/data/models/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  late UserModel user;
  
  void setUser(UserModel user) {
    this.user = user;
    notifyListeners();
  }

}