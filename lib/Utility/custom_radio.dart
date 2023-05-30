import 'package:flutter/material.dart';

import '../Widgets/text_widget.dart';

class CustomRadio extends StatefulWidget {
  const CustomRadio({super.key});
  @override
  State<CustomRadio> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<CustomRadio> {
  int value = 0;
  // ignore: non_constant_identifier_names
  Widget CustomRadioButton(String text, String text2, String text3, int index) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          value = index;
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

  @override
  Widget build(BuildContext context) {
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
