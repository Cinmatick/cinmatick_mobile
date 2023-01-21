import 'dart:convert';

import 'package:cinmatick/Models/get_model.dart';
import 'package:flutter/material.dart';

class HttpService {
  static const String base_url = "https://cinmatick.ictyepprojects.com/api/";

  static const String register = "${base_url}register";

  static const String login = "${base_url}login";

  // static const String blogs = "${base_url}blogs";

  // static const String updateblog = "${base_url}update-blog/";

  // static const String deleteblog = "${base_url}delete-blog/";

  void showMessage(String message, BuildContext context) {
    var snackbar = SnackBar(content: Text(message));

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}


// Future<Get> getGet() async {
//   final response = await http.get('https://cinmatick.ictyepprojects.com/api/');
//   if (response.statusCode == 200) {
//     return Get.fromJson(json.decode(response.body));
//   } else {
//     throw Exception('Failed to load get');
//   }
// }

