import 'package:flutter/material.dart';

import '../../Widgets/appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBodyBehindAppBar: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(10.0),
        child: CustomAppBar(
          title: "Custom App Bar",
          titleWidget: Icon(Icons.face),
        ),
      ),
      backgroundColor: Colors.purple,
    );
  }
}
