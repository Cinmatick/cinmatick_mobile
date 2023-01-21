import 'package:cinmatick/Screens/booking_summary.dart';
import 'package:cinmatick/Services/navigate_help.dart';
import 'package:cinmatick/Widgets/Counter.dart';
import 'package:cinmatick/Widgets/button.dart';
import 'package:cinmatick/Widgets/text_widget.dart';
import 'package:flutter/material.dart';

class SeatScreen extends StatefulWidget {
  const SeatScreen({super.key});

  @override
  State<SeatScreen> createState() => _SeatScreenState();
}

class _SeatScreenState extends State<SeatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Seat",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            textInfo("Avatar 2 - The way of water", FontWeight.w500,
                Colors.white, 15, "Roboto"),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Card(
                    color: Colors.transparent,
                    elevation: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textInfo("Sun 18 December, 2022", FontWeight.w300,
                            Colors.white, 13, "Roboto"),
                        textInfo("IMAX", FontWeight.w300, Colors.white, 13,
                            "Roboto"),
                      ],
                    ),
                  ),
                  Card(
                    color: Colors.transparent,
                    elevation: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textInfo("Golden Screen IMAX Beta City",
                            FontWeight.w300, Colors.white, 13, "Roboto"),
                        textInfo("IMDb Ultra", FontWeight.w300, Colors.white,
                            13, "Roboto"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            const Divider(
              color: Colors.white,
              endIndent: 25.0,
              indent: 25.0,
              thickness: 0.7,
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ClipRRect(
                    borderRadius: BorderRadiusDirectional.circular(4),
                    child: Container(
                      width: 147,
                      height: 191,
                      child: Image.asset(
                        "assets/images/onbordimg1.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Padding(
                  padding: const EdgeInsets.only(bottom: 72),
                  child: Column(
                    children: [
                      Container(
                        height: 30,
                        width: 180,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            border: Border.all(width: 1, color: Colors.white),
                            color: Colors.transparent),
                        child: Column(
                          children: [
                            const SizedBox(height: 5),
                            Center(
                                child: textInfo("Add Ticket", FontWeight.w700,
                                    Colors.white, 15, "Roboto")),
                            const SizedBox(height: 5),
                          ],
                        ),
                      ),
                      const AddCount(),
                      Container(
                        height: 30,
                        width: 180,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            border: Border.all(width: 1, color: Colors.white),
                            color: Colors.transparent),
                        child: Column(
                          children: [
                            const SizedBox(height: 5),
                            Center(
                                child: textInfo("4 Seat", FontWeight.w700,
                                    Colors.white, 15, "Roboto")),
                            const SizedBox(height: 5),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 150),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
              child: GestureDetector(
                onTap: () {
                  goTo(context, const BookingSummary());
                },
                child: ButtonWidget(
                  backgroundcolor: const Color.fromRGBO(255, 134, 50, 10),
                  size: 45,
                  text: 'Proceed to checkout',
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
