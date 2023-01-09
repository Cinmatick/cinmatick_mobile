import 'package:flutter/material.dart';

import 'homewidget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          HomeWidget(),
        ],
      ),
      backgroundColor: Colors.grey,
    );
  }
}
