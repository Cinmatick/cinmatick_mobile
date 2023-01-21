import 'package:cinmatick/Screens/NewPassword_screen/createnewpassword_screen.dart';
import 'package:cinmatick/Screens/OTP%20Verification/otp_verification_widget.dart';
import 'package:cinmatick/Widgets/text_widget.dart';
import 'package:flutter/material.dart';

import '../../Services/navigate_help.dart';
import '../../Widgets/button.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 66, 65, 65),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            elevation: 0,
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
          body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(children: [
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 45.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        textInfo("Enter Verification Code", FontWeight.w500,
                            Colors.white, 22, "roboto"),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        textInfo("Enter code that we have sent to your email ",
                            FontWeight.w300, Colors.white, 16, "roboto"),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
              const OtpVerificationWidget(),
              const SizedBox(
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 80.0, right: 80.0),
                child: GestureDetector(
                  onTap: () {
                    goTo(context, const CreateNewPasswordScreen());
                  },
                  child: ButtonWidget(
                    textColor: Colors.black,
                    backgroundcolor: const Color.fromRGBO(255, 134, 50, 10),
                    borderColor: Colors.black,
                    text: "Verify",
                    icon: Icons.abc_rounded,
                    size: 44,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textInfo("Didn’t receive the code?", FontWeight.w300,
                      Colors.white, 14, "roboto"),
                  textInfo(" Resend", FontWeight.w400,
                      const Color.fromRGBO(255, 134, 50, 10), 14, "roboto"),
                ],
              ),
            ]),
          )),
    );
  }
}
