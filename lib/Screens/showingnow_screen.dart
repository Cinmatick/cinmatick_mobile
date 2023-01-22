import 'package:cinmatick/Screens/seat_screen.dart';
import 'package:cinmatick/Services/navigate_help.dart';
import 'package:cinmatick/Utility/custom_radio.dart';
import 'package:cinmatick/Widgets/button.dart';
import 'package:cinmatick/Widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_calendar/horizontal_calendar.dart';

class ShowingNowScreen extends StatefulWidget {
  const ShowingNowScreen({super.key, required this.name, required this.id});

  final String name;
  final int id;

  @override
  State<ShowingNowScreen> createState() => _ShowingNowScreenState();
}

class _ShowingNowScreenState extends State<ShowingNowScreen> {
  var selectedDate;

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
                    print(date.toString());
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
              Row(
                children: [
                  // Image.asset("Assets/Images/location"),
                  textInfo("Golden screen Imax Beta city", FontWeight.w500,
                      Colors.white, 15, "Roboto"),
                ],
              ),
              textInfo("Beta City Mall, Asaba", FontWeight.w400, Colors.white,
                  12, "Roboto"),
              const SizedBox(height: 60),
              //bigger box
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  CustomRadio(),
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
      ),
    );
  }
}
