import 'package:cinmatick/Screens/showingnow_screen.dart';
import 'package:cinmatick/Services/navigate_help.dart';
import 'package:cinmatick/Widgets/button.dart';
import 'package:cinmatick/Widgets/text_widget.dart';
import 'package:flutter/material.dart';

class BookTicket extends StatefulWidget {
  const BookTicket({super.key, required this.image, required this.name, required this.description, required this.date, required this.rating, required this.pg, required this.id, required this.theatre_id, required this.price, required this.show_id});
  final String image;
  final String name;
  final String description;
  final String date;
  final int rating;
  final String pg;
  final int id;
  final int theatre_id;
   final int show_id;
  final int price;
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
               Container(
                margin: const EdgeInsets.only(right: 10),
                child: Image.network(
                  widget.image,
                  fit: BoxFit.fill,
                  height: 400,
                  width: 300,
                ),
              ),
      
              const SizedBox(height: 10),
              textInfo(widget.name, FontWeight.w500,
                  Colors.white, 20, "Roboto"),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  textInfo(widget.date, FontWeight.w500, Colors.white, 12, "Roboto"),
                  textInfo(
                      "Reviews", FontWeight.w500, Colors.white, 12, "Roboto"),
                  textInfo("⭐ ${widget.rating}.0", FontWeight.w500, Colors.white, 12, "Roboto"),
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
                    textInfo("Casts:", FontWeight.w500,
                        Colors.white, 13, "Roboto"),
                    textInfo(widget.pg, FontWeight.w400,
                        Colors.white, 12, "Roboto"),
                    const SizedBox(height: 20),
                    textInfo("Description", FontWeight.w400, Colors.white, 18,
                        "Roboto"),
                    textInfo(
                        widget.description,
                         FontWeight.w400,
                        Colors.white,
                        14,
                        "Roboto"),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                child: GestureDetector(
                  onTap: () {
                    goTo(context,  ShowingNowScreen(
                      id: widget.id,
                      name: widget.name,
                      image: widget.image,
                      theatre_id: widget.theatre_id,
                      price: widget.price,
                      show_id: widget.show_id,
                    ));
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
      ),
    );
  }
}
