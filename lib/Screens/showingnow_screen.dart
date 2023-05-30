import 'package:cinmatick/Screens/seat_screen.dart';
import 'package:cinmatick/Services/navigate_help.dart';
import 'package:cinmatick/Widgets/button.dart';
import 'package:cinmatick/Widgets/text_widget.dart';
import 'package:cinmatick/util/http_service.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_calendar/horizontal_calendar.dart';
import 'package:intl/intl.dart';

class ShowingNowScreen extends StatefulWidget {
  // ignore: non_constant_identifier_names
  const ShowingNowScreen(
      {super.key,
      required this.name,
      required this.id,
      required this.image,
      required this.theatre_id,
      required this.price,
      required this.show_id});

  final String name;
  final String image;
  final int id;
  // ignore: non_constant_identifier_names
  final int theatre_id;
  // ignore: non_constant_identifier_names
  final int show_id;
  final int price;

  @override
  State<ShowingNowScreen> createState() => _ShowingNowScreenState();
}

class _ShowingNowScreenState extends State<ShowingNowScreen> {
  // ignore: prefer_typing_uninitialized_variables
  var selectedDate;
  // ignore: non_constant_identifier_names, prefer_typing_uninitialized_variables
  var value, cinemaName, cinemaID, Cinematime;

  @override
  void initState() {
    super.initState();
  }

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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 30),
              textInfo(
                  widget.name, FontWeight.w500, Colors.white, 20, "Roboto"),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: HorizontalCalendar(
                  date: DateTime.now().add(const Duration(days: 1)),
                  initialDate: DateTime.now().subtract(const Duration(days: 2)),
                  textColor: Colors.white,
                  backgroundColor: Colors.black,
                  selectedColor: Colors.orange,
                  showMonth: false,
                  onDateSelected: (date) {
                    // ignore: avoid_print
                    print(date);
                    setState(() {
                      selectedDate = date;
                    });
                  },
                ),
              ),

              const SizedBox(height: 40),
              const Divider(
                color: Colors.white,
                endIndent: 25.0,
                indent: 25.0,
                thickness: 1.0,
              ),
              const SizedBox(height: 50),
              // Row(
              //   children: [
              //     // Image.asset("Assets/Images/location"),

              //   ],
              // ),
              textInfo("Location: Golden screen Imax Beta city",
                  FontWeight.w500, Colors.white, 15, "Roboto"),
              textInfo("Beta City Mall, Asaba", FontWeight.w400, Colors.white,
                  12, "Roboto"),
              const SizedBox(height: 60),
              //bigger box
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButtonCustom(context),
                ],
              ),

              const SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                child: GestureDetector(
                  onTap: () {
                    if (cinemaID != null) {
                      goTo(
                          context,
                          SeatScreen(
                            cinemaID: cinemaID,
                            cinemaName: cinemaName,
                            date: selectedDate != null
                                ? DateFormat.yMMMEd().format(
                                    DateTime.parse(selectedDate.toString()))
                                : DateFormat.yMMMEd().format(DateTime.now()),
                            id: widget.id,
                            name: widget.name,
                            time: Cinematime,
                            image: widget.image,
                            price: widget.price,
                            theatre_id: widget.theatre_id,
                            show_id: widget.show_id,
                          ));
                    } else {
                      HttpService().showMessage("Select a Time", context);
                    }
                  },
                  child: ButtonWidget(
                    backgroundcolor: const Color.fromRGBO(255, 134, 50, 10),
                    size: 45,
                    text: 'Book Ticket',
                    borderColor: Colors.black,
                    textColor: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget CustomRadioButton(String text, String text2, String text3, int index) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          value = index;
          cinemaName = text;
          cinemaID = text2;
          Cinematime = text3;
        });
      },
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      // borderSide:
      //     BorderSide(color: (value == index) ? Colors.green : Colors.black),
      child: Container(
        height: 100,
        width: 90,
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            border: Border.all(
                width: 1,
                color: (value == index) ? Colors.orange : Colors.white),
            color: Colors.transparent),
        child: Column(
          children: [
            const SizedBox(height: 10),
            textInfo(text, FontWeight.w500, Colors.white, 14, "Roboto"),
            const SizedBox(height: 2),
            textInfo(text2, FontWeight.w500, Colors.white, 10, "Roboto"),
            const SizedBox(height: 20),
            textInfo(text3, FontWeight.w500, Colors.white, 18, "Roboto")
          ],
        ),
      ),

      // Text(
      //   text,
      //   style: TextStyle(
      //     color: (value == index) ? Colors.green : Colors.black,
      //   ),
      // ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget OutlinedButtonCustom(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Column(
            children: <Widget>[
              CustomRadioButton("2D", "HDolbyAtmos", "11:00AM", 1),
              CustomRadioButton("IMAX", "HDolbyAtmos", "4:30PM", 2),
              // CustomRadioButton("Single", "d", "d", 3),
            ],
          ),
          Column(
            children: <Widget>[
              CustomRadioButton("IMAX", "HDolbyAtmos", "2:00PM", 4),
              CustomRadioButton("2D", "HDolbyAtmos", "8:00PM", 5),
              // CustomRadioButton("Single", "d", "d", 6),
            ],
          ),
          Column(
            children: <Widget>[
              CustomRadioButton("IMAX", "HDolbyAtmos", "3:00PM", 7),
              CustomRadioButton("2D", "HDolbyAtmos", "9:30PM", 8),
              // CustomRadioButton("Single", "d", "d", 9),
            ],
          ),
        ],
      ),
    );
  }
}
