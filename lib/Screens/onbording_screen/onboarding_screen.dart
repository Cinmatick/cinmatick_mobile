import 'package:cinmatick/Screens/SignIn_Screen/signin_screen.dart';
// ignore: unused_import
import 'package:cinmatick/Screens/SignUp_Screen/signup_screen.dart';
import 'package:cinmatick/Screens/onbording_screen/intro_page3.dart';
import 'package:cinmatick/Services/navigate_help.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'intro_page1.dart';
import 'intro_page2.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

// controller to keep track of what page we're on

// keep track of if wwe are on last page or not
bool onLastPage = false;

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        // PAGEVIEW
        PageView(
          controller: _controller,
          onPageChanged: ((index) {
            setState(() {
              onLastPage = (index == 2);
            });
          }),
          children: const [
            IntroPage1(),
            IntroPage2(),
            IntroPage3(),
          ],
        ),
        // DOT INDICATORS
        Container(
          alignment: const Alignment(-0.8, 0.8),
          child: Padding(
            padding: const EdgeInsets.only(left: 31.0, right: 31.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // DOT INDICATOR
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: const SlideEffect(
                    spacing: 8.0,
                    radius: 4.0,
                    dotWidth: 20.0,
                    dotHeight: 10.0,
                    paintStyle: PaintingStyle.fill,
                    strokeWidth: 1.5,
                    // dotColor: Colors.grey,
                    dotColor: Color.fromARGB(255, 233, 196, 117),
                    activeDotColor: Color.fromRGBO(255, 134, 20, 10),
                  ),
                ),
                // NEXT ARROW
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          goTo(context, const SignInScreen());
                        },
                        child: const Icon(
                          Icons.arrow_forward_outlined,
                          size: 31,
                          color: Color.fromRGBO(255, 134, 20, 10),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        child: const Icon(
                          Icons.arrow_forward_outlined,
                          size: 31,
                          color: Color.fromRGBO(255, 134, 20, 10),
                        ),
                      )
              ],
            ),
          ),
        )
      ],
    ));
  }
}




      // body: Stack(
      //   children: [
      //     PageView(
      //       controller: _controller,
      //       onPageChanged: ((index) {
      //         setState(() {
      //           onLastPage = (index == 1);
      //         });
      //       }),
      //       children: const [
      //         OnboardingPage1(),
      //         OnboardingPage2(),
      //       ],
      //     ),
      //     Container(
      //       alignment: const Alignment(0, 1),
      //       child: Padding(
      //         padding: const EdgeInsets.all(15.0),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Container(
      //               alignment: const Alignment(0, 0.7),
      //               child:
      //                   SmoothPageIndicator(controller: _controller, count: 3),
      //             ),
      //             GestureDetector(
      //               onTap: () {
      //                 Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                     builder: (context) => const HomeScreen(),
      //                   ),
      //                 );
      //               },
      //               child: Container(
      //                 width: 20,
      //                 height: 10,
      //                 decoration: BoxDecoration(
      //                   color: Colors.orange,
      //                   borderRadius: BorderRadius.circular(10),
      //                   // border: Border.all(
      //                   //   color: const Color.fromRGBO(255, 134, 20, 10),
      //                   // ),
      //                 ),
      //               ),
      //             ),
      //             onLastPage
      //                 ? GestureDetector(
      //                     onTap: () {
      //                       Navigator.pushReplacement(
      //                         context,
      //                         MaterialPageRoute(
      //                           builder: (context) => const HomeScreen(),
      //                         ),
      //                       );
      //                     },
      //                     child: const Icon(Icons.arrow_forward),
      //                   )
      //                 : GestureDetector(
      //                     onTap: () {
      //                       _controller.nextPage(
      //                           duration: const Duration(milliseconds: 500),
      //                           curve: Curves.easeIn);
      //                     },
      //                     child: const Icon(Icons.arrow_forward),
      //                   ),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ],
      // ),