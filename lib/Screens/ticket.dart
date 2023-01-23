import 'package:cinmatick/Screens/Home_screen/home_screen1.dart';
import 'package:cinmatick/Widgets/text_widget.dart';
import 'package:flutter/material.dart';

import 'Home_screen/home.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key, required this.name, required this.id, required this.cinemaID, required this.cinemaName, required this.time, required this.date, required this.image, required this.seatNo, required this.theatre_id, required this.show_id, required this.price});

  final String name;
  final int id;
  final String cinemaID;
  final String cinemaName;
  final String time;
  final String date;
  final String image;
  final int seatNo;
   final int theatre_id;
   final int show_id;
  final int price;

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              }),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              textInfo("Scan at the counter", FontWeight.w400, Colors.white, 25,
                  "Roboto"),
              const SizedBox(height: 10),
              Container(
                height: 366,
                width: 264,
                color: Colors.transparent,
                child: Center(
                  child: Column(
                    children: [
                      Image.network(
                       widget.image,
                        fit: BoxFit.fill,
                      ),
                      Column(
                        children: [
                          textInfo(widget.name,
                              FontWeight.w400, Colors.white, 18, "Roboto"),
                          textInfo(widget.date, FontWeight.w300,
                              Colors.white, 15, "Roboto"),
                          textInfo(widget.cinemaName + " " + widget.cinemaID,
                              FontWeight.w300, Colors.white, 15, "Roboto"),
                          const SizedBox(height: 20),
                          textInfo(widget.time, FontWeight.w300, Colors.white, 15,
                              "Roboto"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 67),
                child: Row(
                  children: [
                    Image.asset("assets/images/seaticon.png"),
                    const SizedBox(width: 20),
                    textInfo("${widget.seatNo} Seat", FontWeight.w300,
                        Colors.white, 15, "Roboto"),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 67),
                child: Row(
                  children: [
                    Image.asset("assets/images/plusicon.png"),
                    const SizedBox(width: 20),
                    textInfo("2 x caramel popcorns  ", FontWeight.w300,
                        Colors.white, 15, "Roboto"),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textInfo("4 x cans of coca cola drink  ", FontWeight.w300,
                      Colors.white, 15, "Roboto"),
                ],
              ),
              const SizedBox(height: 0),
              Image.asset("assets/images/bellicon.png"),
              const SizedBox(height: 10),
              textInfo(
                  "  Remind Me  ", FontWeight.w300, Colors.white, 12, "Roboto"),
            ],
          ),
        ),
      ),
    );
  }
}
