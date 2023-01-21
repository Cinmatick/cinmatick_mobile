import 'package:flutter/material.dart';

final List<String> imgList = [
  'assets/images/onbordimg1.png',
  'assets/images/onbordimg2.png',
  'assets/images/onbordimg3.png',
];

final List<Widget> imageSliders = imgList
    .map(
      (item) => ClipRRect(
        //borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: [
            Image.asset(
              item,
              fit: BoxFit.fill,
              height: 1000,
              width: 1000.0,
            ),
          ],
        ),
      ),
    )
    .toList();
