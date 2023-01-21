import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpVerificationWidget extends StatefulWidget {
  const OtpVerificationWidget({super.key});

  @override
  State<OtpVerificationWidget> createState() => _OtpVerificationWidgetState();
}

class _OtpVerificationWidgetState extends State<OtpVerificationWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color.fromRGBO(255, 134, 20, 10),
            ),
          ),
          child: TextFormField(
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
            onSaved: (pin1) {},
            style: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(255, 134, 20, 10),
            ),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
            decoration: const InputDecoration(
                hintStyle: TextStyle(
                  color: Color.fromRGBO(255, 134, 20, 10),
                ),
                hintText: "-",
                disabledBorder: InputBorder.none,
                border: InputBorder.none),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color.fromRGBO(255, 134, 20, 10),
            ),
          ),
          child: TextFormField(
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
            onSaved: (pin1) {},
            style: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(255, 134, 20, 10),
            ),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
            decoration: const InputDecoration(
                hintStyle: TextStyle(
                  color: Color.fromRGBO(255, 134, 20, 10),
                ),
                hintText: "-",
                disabledBorder: InputBorder.none,
                border: InputBorder.none),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color.fromRGBO(255, 134, 20, 10),
            ),
          ),
          child: TextFormField(
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
            style: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(255, 134, 20, 10),
            ),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
            decoration: const InputDecoration(
                hintStyle: TextStyle(
                  color: Color.fromRGBO(255, 134, 20, 10),
                ),
                hintText: "-",
                disabledBorder: InputBorder.none,
                border: InputBorder.none),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color.fromRGBO(255, 134, 20, 10),
            ),
          ),
          child: TextFormField(
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
            style: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(255, 134, 20, 10),
            ),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
            decoration: const InputDecoration(
                hintStyle: TextStyle(
                  color: Color.fromRGBO(255, 134, 20, 10),
                ),
                hintText: "-",
                disabledBorder: InputBorder.none,
                border: InputBorder.none),
          ),
        ),
      ],
    );
  }
}
