import 'package:cinmatick/Screens/OTP%20Verification/otp_verification.dart';
import 'package:cinmatick/Services/navigate_help.dart';
import 'package:cinmatick/Widgets/button.dart';
import 'package:cinmatick/Widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 117, 117, 119),
              Colors.black,
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Padding(
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 10, bottom: 20),
                    child: textInfo("Forgot Your Password", FontWeight.w400,
                        Colors.white, 21, "numito")),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                  child: textInfo(
                      "Enter your email to recieve confirmation code",
                      FontWeight.w400,
                      Colors.white,
                      13,
                      "numito"),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: textInfo(
                      "Email", FontWeight.w400, Colors.white70, 17, "Roboto"),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: email,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email cannot be empty";
                      }
                      return null;
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0.8, color: Colors.white70),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0.8, color: Colors.white70),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      hintText: "Email",
                      hintStyle:
                          const TextStyle(fontSize: 13, color: Colors.white70),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                  child: GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        goTo(context, const OtpVerification());
                      }
                    },
                    child: ButtonWidget(
                      backgroundcolor: const Color.fromRGBO(255, 134, 50, 10),
                      size: 45,
                      text: 'Reset Password',
                      borderColor: Colors.black,
                      textColor: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
