import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../Models/user.dart';
import '../preference/user_preference.dart';
import '../util/http_service.dart';

enum Status {
  Registered,
  NotRegistered,
  Registering,
  notLoggedIn,
  loggedIn,
  notLoading,
  isLoading,
  loaded
}

class AuthProvider with ChangeNotifier {
  Status _registerdInStatus = Status.NotRegistered;

  Status _loginStatus = Status.notLoggedIn;

  Status get registeredInStatus => _registerdInStatus;

  Status get loginStatus => _loginStatus;

  Future<Map<String, dynamic>> login(String email, String password) async {
    final Map<String, dynamic> loginData = {
      "email": email,
      "password": password
    };
    // print(loginData);
    _loginStatus = Status.loggedIn;
    notifyListeners();

    var response = await post(Uri.parse(HttpService.login),
            headers: {'content-Type': 'application/json'},
            body: json.encode(loginData))
        .then(onValue)
        .catchError(onError);

    _loginStatus = Status.notLoggedIn;
    notifyListeners();

    return response;
  }

  Future<Map<String, dynamic>> register(
      String name,
      String email,
      String password,
      String confirmPassword,
      String phoneNumber,
      String token) async {
    final Map<String, dynamic> registrationData = {
      "name": name,
      "email": email,
      "password": password,
      "password_confirmation": confirmPassword,
      "phone_no": phoneNumber,
    };
    print(registrationData);
    _registerdInStatus = Status.Registering;
    notifyListeners();

    var response = await post(Uri.parse(HttpService.register),
            body: json.encode(registrationData),
            headers: {
              'content-Type': 'application/json',
              'Accept': 'application/json',
              })
        .then(onValue)
        .catchError(onError);

    _registerdInStatus = Status.NotRegistered;
    notifyListeners();

    return response;
  }

  static Future onValue(Response response) async {
    var result;
    print(response.statusCode);
    final Map<String, dynamic> responseData = json.decode(response.body);
    print(responseData);
    if (response.statusCode == 201 || response.statusCode == 200) {
     

      if (responseData.containsKey('errors')) {
        result = {
          'status': 500,
          'message': responseData['errors'].toString(),
          'data': null
        };
      } else {
        var userdata = responseData['user'];

        User user = User(
           id: userdata['id'],
           name: userdata['name'],
           email: userdata['email'],
          phoneNumber: userdata['phone_no'],
          password: "",
          confirmPassword: "",
          token: responseData['token']
          );

        UserPreference().saveUser(user);

        result = {
          'status': 200,
          'message': responseData['message'],
          'data': user
        };
      }
    } else {
      result = {
        'status': 500,
        'message': responseData['message'],
        'data': responseData
      };
    }

    return result;
  }

  static onError(error) {
    return {'status': false, 'message': 'Unsuccessful Request', 'data': error};
  }
}
