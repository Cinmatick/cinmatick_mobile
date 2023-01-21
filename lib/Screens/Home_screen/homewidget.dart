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

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5, top: 7, bottom: 7),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              SizedBox(
                width: 5,
              ),
              Icon(Icons.search, color: Colors.white70),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: Text(
                  "Search Movies",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MovieScroll extends StatefulWidget {
  const MovieScroll({super.key});

  @override
  State<MovieScroll> createState() => _MovieScrollState();
}

class _MovieScrollState extends State<MovieScroll> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                width: 100,
                height: 100,
                color: Colors.red,
                child: const Center(
                  child: Text('Container 1'),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.green,
                child: const Center(
                  child: Text('Container 2'),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: const Center(
                  child: Text('Container 3'),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.grey,
                child: const Center(
                  child: Text('Container 3'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
