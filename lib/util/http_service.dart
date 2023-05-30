// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class HttpService {
  static const String base_url = "https://cinmatick.ictyepprojects.com/api/";

  static const String register = "${base_url}register";

  static const String login = "${base_url}login";

  static const String home = "${base_url}home";

  static const String showSearch = "${base_url}shows/search";

  static const String book = "${base_url}bookShow";

  static const String bookedShows = "${base_url}bookedShows";

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

