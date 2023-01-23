import 'package:cinmatick/Widgets/text_widget.dart';
import 'package:flutter/material.dart';

import '../Services/navigate_help.dart';
import '../preference/user_preference.dart';
import 'SignIn_Screen/signin_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
 String name = "";
  String email = "";
  @override
  void initState() {
     UserPreference().getUser().then((value) {
      setState(() {
        name = value.name;
      email = value.email;
      });

      
     });


    }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 12, bottom: 12),
                child: CircleAvatar(
                  backgroundColor: Color.fromRGBO(255, 1175, 45, 0.6),
                  child: Image.asset("assets/images/Ellipse 1.png"),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      textInfo(name + "\n" + email, FontWeight.w400, Colors.white, 16,
                          "roboto"),
                      const SizedBox(width: 40),
                      Image.asset("assets/images/editicon.png"),
                    ],
                  ),
                  // const SizedBox(height: 2),
                  // textInfo(email, FontWeight.w400,
                  //     Colors.white, 12, "roboto"),
                ],
              ),
              const SizedBox(width: 50),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              top: 12,
              bottom: 12,
            ),
            child: textInfo(
                "My Account", FontWeight.w400, Colors.white, 12, "roboto"),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 20.0, top: 12, bottom: 12, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textInfo("Personal info", FontWeight.w400, Colors.white, 17,
                    "roboto"),
                const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 20.0, top: 12, bottom: 12, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textInfo("Payout notification", FontWeight.w400, Colors.white,
                    17, "roboto"),
                const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 20.0, top: 12, bottom: 12, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textInfo(
                    "Settings", FontWeight.w400, Colors.white, 17, "roboto"),
                const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 20.0, top: 12, bottom: 12, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textInfo("Notification", FontWeight.w400, Colors.white, 17,
                    "roboto"),
                // Image.asset("assets/images/notifyicon.png"),
              ],
            ),
          ),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.only(
                left: 20.0, top: 12, bottom: 12, right: 20),
            child: textInfo(
                "Information", FontWeight.w400, Colors.white, 12, "roboto"),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 20.0, top: 12, bottom: 12, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textInfo("Privacy Policy", FontWeight.w400, Colors.white, 17,
                    "roboto"),
                const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 20.0, top: 12, bottom: 12, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textInfo(
                    "Contact us", FontWeight.w400, Colors.white, 17, "roboto"),
                const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          GestureDetector(
            onTap: () {
               UserPreference().removeUser();
                goTo(context, const SignInScreen());
            },
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 12, bottom: 12),
                  child: Image.asset("assets/images/logouticon.png"),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 12, bottom: 12),
                  child: textInfo(
                      "Log out", FontWeight.w400, Colors.white, 17, "roboto"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
