import 'package:shared_preferences/shared_preferences.dart';

import '../Models/user.dart';

class UserPreference {
  Future<bool> saveUser(User user) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("id", user.id.toString());
    pref.setString("name", user.name);
    pref.setString("email", user.name);
    pref.setString("phone_no", user.name);
    pref.setString("token", user.token);
    return true;
  }

  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String id = prefs.getString("id").toString();
    String name = prefs.getString("name").toString();
    String token = prefs.getString("token").toString();
    String email = prefs.getString("email").toString();
    String phoneNumber = prefs.getString("phone_no").toString();
    // String password = prefs.getString("password").toString();
    // String confirmPassword = prefs.getString("Confirm password").toString();
    return User(
        id: id,
        name: name,
        token: token,
        email: email,
        password: "",
        phoneNumber: phoneNumber,
        confirmPassword: "");
  }

  void removeUser() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.remove("id");
    preferences.remove("name");
    preferences.remove("token");
    preferences.remove("email");
    preferences.remove("phone_no");
    // preferences.remove("password");
    // preferences.remove("confirmPassword");
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token").toString();

    return token;
  }
}
