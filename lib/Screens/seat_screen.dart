// ignore_for_file: unnecessary_new

import 'package:cinmatick/Screens/booking_summary.dart';
import 'package:cinmatick/Services/navigate_help.dart';
import 'package:cinmatick/Widgets/button.dart';
import 'package:cinmatick/Widgets/text_widget.dart';
import 'package:cinmatick/util/http_service.dart';
import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';

class SeatScreen extends StatefulWidget {
  // ignore: non_constant_identifier_names
  const SeatScreen(
      {super.key,
      required this.name,
      required this.id,
      required this.cinemaID,
      required this.cinemaName,
      required this.time,
      required this.date,
      required this.image,
      required this.theatre_id,
      required this.show_id,
      required this.price});

  final String name;
  final int id;
  // ignore: non_constant_identifier_names
  final int theatre_id;
  // ignore: non_constant_identifier_names
  final int show_id;
  final int price;
  final String cinemaID;
  final String cinemaName;
  final String time;
  final String date;
  final String image;

  @override
  State<SeatScreen> createState() => _SeatScreenState();
}

class _SeatScreenState extends State<SeatScreen> {
  final TextEditingController _controller = new TextEditingController();
  // ignore: prefer_typing_uninitialized_variables
  var seat;
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
            textInfo(widget.name, FontWeight.w500, Colors.white, 15, "Roboto"),
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
                        textInfo(widget.date, FontWeight.w300, Colors.white, 13,
                            "Roboto"),
                        textInfo(widget.cinemaName, FontWeight.w600,
                            Colors.white, 16, "Roboto"),
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
                        textInfo(widget.cinemaID, FontWeight.w600, Colors.white,
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
                    // ignore: sized_box_for_whitespace
                    child: Container(
                      width: 150,
                      height: 220,
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
                          child: Center(
                            child: textInfo("Add Ticket", FontWeight.w400,
                                Colors.white, 12, "Roboto"),
                          )),

                      Container(
                        width: 180,
                        height: 50,
                        // color: Colors.white,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            border: Border.all(width: 1, color: Colors.white),
                            color: Colors.transparent),
                        child: NumberInputPrefabbed.roundedButtons(
                          controller: _controller,
                          onIncrement: (num newlyIncrementedValue) {
                            setState(() {
                              seat = newlyIncrementedValue;
                            });
                          },
                          onDecrement: (num newlyDecrementedValue) {
                            setState(() {
                              seat = newlyDecrementedValue;
                            });
                          },
                          incDecBgColor: Colors.orange,
                          buttonArrangement: ButtonArrangement.incRightDecLeft,
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 180,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            border: Border.all(width: 1, color: Colors.white),
                            color: Colors.transparent),
                        child: Center(
                            child: textInfo(
                                seat == null ? "0 Seat" : "$seat Seat(s)",
                                FontWeight.w700,
                                Colors.white,
                                13,
                                "Roboto")),
                      ),

                      //   Container(
                      //   height: 34,
                      //   width: 180,
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(3),
                      //       border: Border.all(width: 1, color: Colors.white),
                      //       color: Colors.transparent),
                      //   child:
                      //       Center(
                      //           child: textInfo("#0", FontWeight.w700,
                      //               Colors.white, 16, "Roboto")),

                      // ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 70),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
              child: GestureDetector(
                onTap: () {
                  if (seat != null) {
                    goTo(
                        context,
                        BookingSummary(
                          name: widget.name,
                          id: widget.id,
                          cinemaID: widget.cinemaID,
                          cinemaName: widget.cinemaName,
                          time: widget.time,
                          date: widget.date,
                          image: widget.image,
                          seatNo: seat,
                          price: widget.price,
                          show_id: widget.show_id,
                          theatre_id: widget.theatre_id,
                        ));
                  } else {
                    HttpService().showMessage("Select Seat Number", context);
                  }
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
