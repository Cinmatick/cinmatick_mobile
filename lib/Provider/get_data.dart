import 'dart:convert';

import 'package:cinmatick/Provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class GetDataProvider with ChangeNotifier {
  Status _isLoadingData = Status.notLoading;

  Status get isLoadingData => _isLoadingData;

// fetch all data of blog from the server
  Future getData(url, token) async {
    _isLoadingData = Status.loggedIn;
    notifyListeners();

    dynamic response = await get(
      Uri.parse(url),
      headers: {
        'content-Type': 'application/json',
        'Accept': 'application/json',
        // ignore: prefer_interpolation_to_compose_strings
        'Authorization': 'Bearer ' + token
      },
    );

    _isLoadingData = Status.notLoggedIn;
    notifyListeners();

    return response;
  }

  // this is to get save
  Future saveData(
      Map<String, dynamic> blogData, String url, String token) async {
    // final Map<String, dynamic> blogData = {
    //     "title" : title,
    //     "body" : body,
    //     "author" : author
    // };

    final response = await post(Uri.parse(url),
        headers: {
          'content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: json.encode(blogData));

    return response;
  }
}
