import 'package:cinmatick/Screens/seat_screen.dart';
import 'package:cinmatick/Services/navigate_help.dart';
import 'package:cinmatick/Widgets/button.dart';
import 'package:cinmatick/Widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ShowingNowScreen extends StatefulWidget {
  const ShowingNowScreen({super.key});

  @override
  State<ShowingNowScreen> createState() => _ShowingNowScreenState();
}

class _ShowingNowScreenState extends State<ShowingNowScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Showing now",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),
            textInfo("Avatar 2 - The way of water", FontWeight.w500,
                Colors.white, 15, "Roboto"),
            const SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 40,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(width: 1, color: Colors.white),
                      color: Colors.transparent),
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      textInfo(
                          "Tue", FontWeight.w500, Colors.white, 9, "Roboto"),
                      const SizedBox(height: 5),
                      textInfo("12", FontWeight.w500, Colors.white, 9, "Roboto")
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(width: 1, color: Colors.white),
                      color: Colors.transparent),
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      textInfo(
                          "Wed", FontWeight.w500, Colors.white, 9, "Roboto"),
                      const SizedBox(height: 5),
                      textInfo("12", FontWeight.w500, Colors.white, 9, "Roboto")
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(width: 1, color: Colors.white),
                      color: Colors.transparent),
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      textInfo(
                          "Thur", FontWeight.w500, Colors.white, 9, "Roboto"),
                      const SizedBox(height: 5),
                      textInfo("12", FontWeight.w500, Colors.white, 9, "Roboto")
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(width: 1, color: Colors.white),
                      color: Colors.transparent),
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      textInfo(
                          "Fri", FontWeight.w500, Colors.white, 9, "Roboto"),
                      const SizedBox(height: 5),
                      textInfo("12", FontWeight.w500, Colors.white, 9, "Roboto")
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(width: 1, color: Colors.white),
                      color: Colors.transparent),
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      textInfo(
                          "sat", FontWeight.w500, Colors.white, 9, "Roboto"),
                      const SizedBox(height: 5),
                      textInfo("12", FontWeight.w500, Colors.white, 9, "Roboto")
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(width: 1, color: Colors.white),
                      color: Colors.transparent),
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      textInfo(
                          "sun", FontWeight.w500, Colors.white, 9, "Roboto"),
                      const SizedBox(height: 5),
                      textInfo("12", FontWeight.w500, Colors.white, 9, "Roboto")
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Divider(
              color: Colors.white,
              endIndent: 25.0,
              indent: 25.0,
              thickness: 1.0,
            ),
            const SizedBox(height: 50),
            textInfo("Golden screen Imax Beta city", FontWeight.w500,
                Colors.white, 15, "Roboto"),
            textInfo("Beta City Mall, Asaba", FontWeight.w400, Colors.white, 12,
                "Roboto"),
            const SizedBox(height: 50),
            //bigger box
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(width: 1, color: Colors.white),
                      color: Colors.transparent),
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      textInfo(
                          "sun", FontWeight.w500, Colors.white, 9, "Roboto"),
                      const SizedBox(height: 5),
                      textInfo("12", FontWeight.w500, Colors.white, 9, "Roboto")
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(width: 1, color: Colors.white),
                      color: Colors.transparent),
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      textInfo(
                          "sun", FontWeight.w500, Colors.white, 9, "Roboto"),
                      const SizedBox(height: 5),
                      textInfo("12", FontWeight.w500, Colors.white, 9, "Roboto")
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(width: 1, color: Colors.white),
                      color: Colors.transparent),
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      textInfo(
                          "sun", FontWeight.w500, Colors.white, 9, "Roboto"),
                      const SizedBox(height: 5),
                      textInfo("12", FontWeight.w500, Colors.white, 9, "Roboto")
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            //bigger box second box
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(width: 1, color: Colors.white),
                      color: Colors.transparent),
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      textInfo(
                          "sun", FontWeight.w500, Colors.white, 9, "Roboto"),
                      const SizedBox(height: 5),
                      textInfo("12", FontWeight.w500, Colors.white, 9, "Roboto")
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(width: 1, color: Colors.white),
                      color: Colors.transparent),
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      textInfo(
                          "sun", FontWeight.w500, Colors.white, 9, "Roboto"),
                      const SizedBox(height: 5),
                      textInfo("12", FontWeight.w500, Colors.white, 9, "Roboto")
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(width: 1, color: Colors.white),
                      color: Colors.transparent),
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      textInfo(
                          "sun", FontWeight.w500, Colors.white, 9, "Roboto"),
                      const SizedBox(height: 5),
                      textInfo("12", FontWeight.w500, Colors.white, 9, "Roboto")
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
              child: GestureDetector(
                onTap: () {
                  goTo(context, const SeatScreen());
                },
                child: ButtonWidget(
                  backgroundcolor: const Color.fromRGBO(255, 134, 50, 10),
                  size: 45,
                  text: 'Book Ticket ',
                  borderColor: Colors.black,
                  textColor: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
