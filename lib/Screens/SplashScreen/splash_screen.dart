import 'package:cinmatick/Screens/onbording_screen/onboarding_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2)).then((value) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: ((context) => const OnboardingScreen()),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 117, 117, 119),
          Colors.black,
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
              image: AssetImage("assets/images/splashimage.png"),
              width: 250,
            ),
            SizedBox(height: 50),
            SpinKitSpinningLines(
              color: Colors.amber,
              size: 50.0,
            )
          ],
        ),
      ),
    ));
    // Scaffold(
    //   backgroundColor: Colors.grey,
    //   body: SizedBox(
    //     width: double.infinity,
    //     child:
    // Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Container(
    //           decoration: const BoxDecoration(
    //             gradient: LinearGradient(colors: [
    //               Colors.blue,
    //               Colors.grey,
    //             ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
    //           ),
    //         ),
    //         const Image(
    //           image: AssetImage("assets/images/splashimage.png"),
    //           width: 250,
    //         ),
    //         const SizedBox(height: 50),
    //         const SpinKitSpinningLines(
    //           color: Colors.amber,
    //           size: 50.0,
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}
