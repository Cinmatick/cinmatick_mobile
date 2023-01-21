import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/user.dart';

class UserPreference {
  Future<bool> saveUser(User user) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setString("name", user.name);
    pref.setString("token", user.token);
    return true;
  }

  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String name = prefs.getString("name").toString();
    String token = prefs.getString("token").toString();
    String email = prefs.getString("email").toString();
    String phoneNumber = prefs.getString("phoneNumber").toString();
    String password = prefs.getString("password").toString();
    String confirmPassword = prefs.getString("Confirm password").toString();
    return User(
        name: name,
        token: token,
        email: email,
        password: password,
        phoneNumber: phoneNumber,
        confirmPassword: confirmPassword);
  }

  void removeUser() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.remove("name");
    preferences.remove("token");
    preferences.remove("email");
    preferences.remove("phoneNumber");
    preferences.remove("password");
    preferences.remove("confirmPassword");
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token").toString();

    return token;
  }
}
