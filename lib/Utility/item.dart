import 'package:flutter/material.dart';

import '../Widgets/text_widget.dart';

List<Widget> imageSliders(List<String> imgList, List<String>? nameList) {
  return imgList.map((item) {
    var index = imgList.indexOf(item);
    return ClipRRect(
      //borderRadius: const BorderRadius.all(Radius.circular(5.0)),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: Image.network(
              item,
              fit: BoxFit.fill,
              height: 1000,
              width: 1000,
            ),
          ),
          nameList!.isNotEmpty
              ? Center(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(color: Colors.redAccent),
                    child: textInfo(nameList[index], FontWeight.w400,
                        Colors.white, 13, "Roboto"),
                  ),
                )
              : Container()
        ],
      ),
    );
  }).toList();
}
