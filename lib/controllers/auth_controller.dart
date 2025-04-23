import 'package:flutter/material.dart';

class AuthController extends ChangeNotifier {
  String username = "cahaya";
  String password = "123456";
  bool isLoggedIn = false;

  bool login(String user, String pass) {
    if ((user == username && pass == password)) {
      username = user;
      isLoggedIn = true;
      notifyListeners();
      return true;
    }
    return false;
  }
}
