import 'package:cinmatick/Widgets/text_widget.dart';
import 'package:flutter/material.dart';

class AddCount extends StatefulWidget {
  const AddCount({super.key});

  @override
  State<AddCount> createState() => _AddCountState();
}

class _AddCountState extends State<AddCount> {
  int counter = 0;

  addCounter() {
    setState(() {
      counter++;
    });
  }

  subCounter() {
    setState(() {
      counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            if (counter <= 0) {
            } else {
              setState(() {
                counter--;
              });
            }
          },
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                border: Border.all(width: 1, color: Colors.white),
                color: Colors.transparent),
            child: Column(
              children: [
                const SizedBox(height: 5, width: 50),
                Center(
                  child: textInfo(
                      "-", FontWeight.w700, Colors.white, 15, "Roboto"),
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 50,
          height: 50,
        ),
        Text(
          "$counter",
          style: const TextStyle(fontSize: 30.0, color: Colors.white),
        ),
        const SizedBox(width: 50),
        GestureDetector(
          onTap: () {
            if (counter <= 0) {
            } else {
              setState(() {
                counter++;
              });
            }
          },
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                border: Border.all(width: 1, color: Colors.white),
                color: Colors.transparent),
            child: Column(
              children: [
                const SizedBox(height: 5),
                Center(
                    child: textInfo(
                        "+", FontWeight.w500, Colors.white, 15, "Roboto")),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
