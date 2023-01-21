import 'package:cinmatick/Screens/ticket.dart';
import 'package:cinmatick/Services/navigate_help.dart';
import 'package:cinmatick/Widgets/text_widget.dart';
import 'package:flutter/material.dart';

import '../Widgets/button.dart';

class BookingSummary extends StatefulWidget {
  const BookingSummary({super.key});

  @override
  State<BookingSummary> createState() => _BookingSummaryState();
}

class _BookingSummaryState extends State<BookingSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Summary'),
        centerTitle: true,
      ),
      body: Column(children: [
        const SizedBox(height: 20),
        //CODE FOR MOVIE IMAGE
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ClipRRect(
                borderRadius: BorderRadiusDirectional.circular(4),
                child: Container(
                  width: 86,
                  height: 140,
                  child: Image.asset(
                    "assets/images/onbordimg1.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            //CODE FOR TEXT BESIDE MOVIE IMAGE
            Column(
              children: [
                textInfo("Avatar 2:\nThe way of water      ", FontWeight.w500,
                    Colors.white, 15, "Roboto"),
                const SizedBox(height: 55),
                textInfo("Sun, 18 December 2022 14:00", FontWeight.w400,
                    Colors.white60, 10, "Roboto"),
                textInfo("Golden Screen IMAX Beta City", FontWeight.w400,
                    Colors.white60, 10, "Roboto"),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        // CODE FOR DIVIDER
        const Padding(
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
          child: Divider(
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 5),
        // CODE FOR PAYMENT TEXT
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Row(
            children: [
              textInfo("Payment", FontWeight.w700, Colors.white, 15, "Roboto"),
            ],
          ),
        ),
        const SizedBox(height: 10),
        // CODE FOR MOVIE TICKET TEXT
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textInfo("Movie Tickets", FontWeight.w400, Colors.white, 13,
                      "Roboto"),
                  textInfo("Seats...... F4, F5. F6, F7.", FontWeight.w400,
                      Colors.white, 13, "Roboto"),
                  textInfo("4 x NGN2000", FontWeight.w400, Colors.white, 13,
                      "Roboto"),
                ],
              ),
              textInfo("NGN8000", FontWeight.w700, Colors.white, 13, "Roboto"),
            ],
          ),
        ),
        const SizedBox(height: 5),
        // CODE FOR DIVIDER
        const Padding(
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
          child: Divider(
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 10),
        //CODE FOR TOTAL TEXT
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textInfo("TOTAL", FontWeight.w600, Colors.white, 13, "Roboto"),
              textInfo("NGN8,000", FontWeight.w600, Colors.white, 13, "Roboto"),
            ],
          ),
        ),
        const SizedBox(height: 10),
        //CODE FOR PAYMENT METHOD TEXT
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Row(
            children: [
              textInfo("Payment Method", FontWeight.w600, Colors.white, 13,
                  "Roboto"),
            ],
          ),
        ),
        const SizedBox(height: 200),
        //CODE FOR BUTTON
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
          child: GestureDetector(
            onTap: () {
              goTo(context, const TicketScreen());
            },
            child: ButtonWidget(
              backgroundcolor: const Color.fromRGBO(255, 134, 50, 10),
              size: 45,
              text: 'Pay',
              borderColor: Colors.black,
              textColor: Colors.black,
            ),
          ),
        )
      ]),
    );
  }
}
