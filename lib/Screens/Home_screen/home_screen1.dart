import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinmatick/Screens/profile_screen.dart';
import 'package:cinmatick/Services/navigate_help.dart';

import 'package:cinmatick/Utility/item.dart';
import 'package:cinmatick/Widgets/text_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({super.key});

  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: 220,
        backgroundColor: const Color.fromARGB(255, 41, 41, 44),
        child: ListView(
          children: [
            Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, top: 12, bottom: 12),
                  child: CircleAvatar(
                    child: Image.asset("assets/images/Ellipse 1.png"),
                  ),
                ),
                const SizedBox(width: 12),
                textInfo(
                    "Solomon", FontWeight.w400, Colors.white, 17, "roboto"),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 12, bottom: 12),
              child:
                  textInfo("Home", FontWeight.w400, Colors.white, 17, "roboto"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 12, bottom: 12),
              child: textInfo(
                  "My Ticket", FontWeight.w400, Colors.white, 17, "roboto"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 12, bottom: 12),
              child: textInfo(
                  "My List", FontWeight.w400, Colors.white, 17, "roboto"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 12, bottom: 12),
              child: textInfo(
                  "Profile", FontWeight.w400, Colors.white, 17, "roboto"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 12, bottom: 12),
              child: textInfo("Help and Support", FontWeight.w400, Colors.white,
                  17, "roboto"),
            ),
            const SizedBox(height: 90),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 12, bottom: 12),
              child: textInfo(
                  "Log out", FontWeight.w400, Colors.white, 17, "roboto"),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        actions: [
          CircleAvatar(
            child: GestureDetector(
                onTap: () {
                  goTo(context, const ProfileScreen());
                },
                child: Image.asset("assets/images/Ellipse 1.png")),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        textInfo("Welcome", FontWeight.w600, Colors.white, 21,
                            "roboto"),
                        textInfo("Solomon", FontWeight.w500, Colors.white, 17,
                            "roboto"),
                      ],
                    ),
                    const Icon(
                      Icons.notifications,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Code for search bar
              // const SearchTool(con),
              const SizedBox(height: 20),
              // text code
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Row(
                  children: [
                    textInfo("Trending Movies", FontWeight.w600, Colors.white,
                        17, "roboto"),
                  ],
                ),
              ),

              //  code for slidder

              const SizedBox(
                height: 20,
              ),
              CarouselSlider(
                items: imageSliders,
                carouselController: _controller,
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 1.5,
                  viewportFraction: 0.5,
                  onPageChanged: ((index, reason) {
                    setState(
                      () {
                        setState(() {
                          // _current = index;
                        });
                      },
                    );
                  }),
                ),
              ),

              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: textInfo(
                    "Categories", FontWeight.w600, Colors.white, 17, "roboto"),
              ),
              const SizedBox(height: 10),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 100,
                          height: 137,
                          child: Center(
                            child: Image.asset("assets/images/cat3.png"),
                          ),
                        ),
                        textInfo("text", FontWeight.w400, Colors.white, 13,
                            "Roboto"),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Container(
                          width: 100,
                          height: 137,
                          child: Center(
                            child: Image.asset("assets/images/cat2.png"),
                          ),
                        ),
                        textInfo("text", FontWeight.w400, Colors.white, 13,
                            "Roboto"),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Container(
                          width: 100,
                          height: 137,
                          child: Center(
                            child: Image.asset("assets/images/cat1.png"),
                          ),
                        ),
                        textInfo("text", FontWeight.w400, Colors.white, 13,
                            "Roboto"),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Container(
                          width: 100,
                          height: 137,
                          child: Center(
                            child: Image.asset("assets/images/cat4.png"),
                          ),
                        ),
                        textInfo("text", FontWeight.w400, Colors.white, 13,
                            "Roboto"),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Column(
                      children: [
                        Container(
                          width: 100,
                          height: 137,
                          child: Image.asset("assets/images/cat2.png"),
                        ),
                        textInfo("text", FontWeight.w400, Colors.white, 13,
                            "Roboto"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
