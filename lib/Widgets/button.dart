import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonWidget extends StatelessWidget {
  final Color textColor;
  final Color backgroundcolor;
  final Color borderColor;
  final String text;
  IconData? icon;
  final double size;
  ButtonWidget({
    super.key,
    required this.textColor,
    required this.backgroundcolor,
    required this.borderColor,
    required this.text,
    this.icon,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: size,
      decoration: BoxDecoration(
        color: backgroundcolor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: borderColor,
          width: 1.0,
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
