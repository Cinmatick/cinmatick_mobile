import 'dart:convert';

import 'package:cinmatick/Provider/get_data.dart';
import 'package:cinmatick/Screens/ticket.dart';
import 'package:cinmatick/Services/navigate_help.dart';
import 'package:cinmatick/Widgets/text_widget.dart';
import 'package:cinmatick/preference/user_preference.dart';
import 'package:cinmatick/util/http_service.dart';
import 'package:flutter/material.dart';

import '../Widgets/button.dart';

class BookingSummary extends StatefulWidget {
  // ignore: non_constant_identifier_names
  const BookingSummary(
      {super.key,
      required this.name,
      required this.id,
      required this.cinemaID,
      required this.cinemaName,
      required this.time,
      required this.date,
      required this.image,
      required this.seatNo,
      required this.theatre_id,
      required this.show_id,
      required this.price});

  final String name;
  final int id;
  final String cinemaID;
  final String cinemaName;
  final String time;
  final String date;
  final String image;
  final int seatNo;
  // ignore: non_constant_identifier_names
  final int theatre_id;
  // ignore: non_constant_identifier_names
  final int show_id;
  final int price;

  @override
  State<BookingSummary> createState() => _BookingSummaryState();
}

class _BookingSummaryState extends State<BookingSummary> {
  var loading = false;
  @override
  Widget build(BuildContext context) {
    final price = widget.seatNo * widget.price;
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
                // ignore: sized_box_for_whitespace
                child: Container(
                  width: 86,
                  height: 140,
                  child: Image.network(
                    widget.image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            //CODE FOR TEXT BESIDE MOVIE IMAGE
            Column(
              children: [
                textInfo(
                    widget.name, FontWeight.w500, Colors.white, 15, "Roboto"),
                const SizedBox(height: 55),
                textInfo(
                    widget.date, FontWeight.w400, Colors.white60, 10, "Roboto"),
                textInfo("${widget.cinemaName}\n${widget.cinemaID}",
                    FontWeight.w400, Colors.white60, 10, "Roboto"),
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
                  textInfo("${widget.seatNo} * NGN${widget.price}",
                      FontWeight.w400, Colors.white, 13, "Roboto"),
                ],
              ),
              textInfo(
                  "NGN$price", FontWeight.w700, Colors.white, 13, "Roboto"),
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
              textInfo(
                  "NGN$price", FontWeight.w600, Colors.white, 13, "Roboto"),
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
          child: loading == true
              ? const Center(child: CircularProgressIndicator())
              : GestureDetector(
                  onTap: () {
                    setState(() {
                      loading = true;
                    });
                    UserPreference().getUser().then((user) {
                      final Map<String, dynamic> bookData = {
                        "number_of_seats": widget.seatNo,
                        "show_id": widget.show_id,
                        // "user_id": "",
                      };
                      GetDataProvider()
                          .saveData(bookData, HttpService.book, user.token)
                          .then((response) {
                        if (response.statusCode == 200) {
                          // print(json.decode(response.body));
                          var responseData = json.decode(response.body);
                          goTo(
                              context,
                              TicketScreen(
                                  name: widget.name,
                                  id: widget.id,
                                  cinemaID: widget.cinemaID,
                                  cinemaName: widget.cinemaName,
                                  time: widget.time,
                                  date: widget.date,
                                  image: widget.image,
                                  seatNo: widget.seatNo,
                                  theatre_id: widget.theatre_id,
                                  show_id: widget.show_id,
                                  price: widget.price));
                          HttpService()
                              .showMessage(responseData['message'], context);
                        } else {
                          HttpService()
                              .showMessage("Error booking Show", context);
                        }
                        setState(() => loading = false);
                      });
                    });
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
