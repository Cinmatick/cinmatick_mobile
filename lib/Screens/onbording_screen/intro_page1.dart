import 'package:flutter/material.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: const Image(
        image: AssetImage("assets/images/onbordimg1.png"),
        fit: BoxFit.cover,
      ),
    );
  }
}
