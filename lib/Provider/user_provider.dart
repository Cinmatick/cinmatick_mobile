import 'package:cinmatick/Models/user.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  var changeName = "name";
  var changeEmail = "email";
  var changepassword = "password";
  var token = "";

  void setUser(User user) {
    changeName = user.name;
    changeEmail = user.email;
    changepassword = user.password;
    token = user.token;
    notifyListeners();
  }
}
