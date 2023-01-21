import 'package:cinmatick/Screens/showingnow_screen.dart';
import 'package:cinmatick/Services/navigate_help.dart';
import 'package:cinmatick/Widgets/button.dart';
import 'package:cinmatick/Widgets/text_widget.dart';
import 'package:flutter/material.dart';

class BookTicket extends StatefulWidget {
  const BookTicket({super.key});

  @override
  State<BookTicket> createState() => _BookTicketState();
}

class _BookTicketState extends State<BookTicket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        Image.asset("assets/images/Rectangle.png"),
      ]),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 200,
              width: 200,
              child: Image.asset("assets/images/onbordimg1.png"),
            ),
            const SizedBox(height: 10),
            textInfo("Avatar 2: The way of water", FontWeight.w500,
                Colors.white, 15, "Roboto"),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                textInfo("2022", FontWeight.w500, Colors.white, 12, "Roboto"),
                textInfo(
                    "Reviews", FontWeight.w500, Colors.white, 12, "Roboto"),
                textInfo("⭐ 7.8", FontWeight.w500, Colors.white, 12, "Roboto"),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  color: const Color.fromRGBO(255, 134, 50, 10),
                  height: 20,
                  width: 60,
                  child: Center(
                    child: textInfo(
                        "Action", FontWeight.w500, Colors.black, 10, "Roboto"),
                  ),
                ),
                Container(
                  color: const Color.fromRGBO(255, 134, 50, 10),
                  height: 20,
                  width: 80,
                  child: Center(
                    child: textInfo("Adventure", FontWeight.w500, Colors.black,
                        10, "Roboto"),
                  ),
                ),
                Container(
                  color: const Color.fromRGBO(255, 134, 50, 10),
                  height: 20,
                  width: 60,
                  child: Center(
                    child: textInfo(
                        "Fantasy", FontWeight.w500, Colors.black, 10, "Roboto"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Container(
              child: Column(
                children: [
                  textInfo("Golden screen Imax Beta city", FontWeight.w500,
                      Colors.white, 15, "Roboto"),
                  textInfo("Beta City Mall, Asaba", FontWeight.w400,
                      Colors.white, 12, "Roboto"),
                  const SizedBox(height: 20),
                  textInfo("Description", FontWeight.w400, Colors.white, 15,
                      "Roboto"),
                  textInfo(
                      "Jake Sully and Ney’tiri have\n  formed a family and are \ndoing everything...Read more",
                      FontWeight.w400,
                      Colors.white,
                      10,
                      "Roboto"),
                ],
              ),
            ),
            const SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
              child: GestureDetector(
                onTap: () {
                  goTo(context, const ShowingNowScreen());
                },
                child: ButtonWidget(
                  backgroundcolor: const Color.fromRGBO(255, 134, 50, 10),
                  size: 45,
                  text: 'Book Movie ',
                  borderColor: Colors.black,
                  textColor: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
