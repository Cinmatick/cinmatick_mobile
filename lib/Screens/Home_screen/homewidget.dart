import 'package:cinmatick/Screens/OTP%20Verification/otp_verification.dart';
import 'package:flutter/material.dart';

import '../../Services/navigate_help.dart';
import '../../Widgets/button.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: ButtonWidget(
              textColor: Colors.black,
              backgroundcolor: Colors.cyan,
              borderColor: Colors.black,
              text: "text",
              icon: Icons.abc_rounded,
              size: 40,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: GestureDetector(
              onTap: () {
                goTo(context, const OtpVerification());
              },
              child: ButtonWidget(
                textColor: Colors.black,
                backgroundcolor: Colors.cyan,
                borderColor: Colors.black,
                text: "OTP verification",
                icon: Icons.abc_rounded,
                size: 40,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
