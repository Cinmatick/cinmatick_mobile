import 'package:cinmatick/Screens/Home_screen/homewidget.dart';
import 'package:cinmatick/Screens/book_ticket_screen.dart';
import 'package:cinmatick/Services/navigate_help.dart';
import 'package:cinmatick/Widgets/search.dart';
import 'package:cinmatick/Widgets/text_widget.dart';

import 'package:flutter/material.dart';

class NowShowingScreen extends StatefulWidget {
  const NowShowingScreen({super.key});

  @override
  State<NowShowingScreen> createState() => _NowShowingScreenState();
}

class _NowShowingScreenState extends State<NowShowingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // const SearchTool(),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                goTo(context, const BookTicket());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    child: Image.asset("assets/images/onbordimg1.png"),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textInfo("Avatar 2", FontWeight.w500, Colors.white,
                              15, "Roboto"),
                          textInfo("The way of water", FontWeight.w500,
                              Colors.white, 15, "Roboto"),
                          textInfo("Star", FontWeight.w500, Colors.white, 15,
                              "Roboto"),
                        ],
                      ),
                    ),
                  ),
                  textInfo("2022", FontWeight.w500, Colors.white, 15, "Roboto"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
