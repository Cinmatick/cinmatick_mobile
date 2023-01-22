import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinmatick/Screens/SignIn_Screen/signin_screen.dart';
import 'package:cinmatick/Screens/profile_screen.dart';
import 'package:cinmatick/Services/navigate_help.dart';

import 'package:cinmatick/Utility/item.dart';
import 'package:cinmatick/Widgets/text_widget.dart';
import 'package:cinmatick/preference/user_preference.dart';
import 'package:flutter/material.dart';

import '../../Provider/get_data.dart';
import '../../util/http_service.dart';

class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({super.key});

  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  final CarouselController _controller = CarouselController();
   String name = "";
  String token = "";

  final String url = "https://cinmatick.ictyepprojects.com/storage/";

  final List<String> imgList = [];

  final List<String> imgListCategories = [];

  final List<String> nameCategories = [];

  bool loading = true;

 

@override
  void initState() {
     UserPreference().getUser().then((value) {
      name = value.name;
      token = value.token;

       GetDataProvider().getData(HttpService.home, token).then((response) {
       final Map<String, dynamic> responseData = json.decode(response.body);

          if(response.statusCode == 200){

             
            // load treading images
            
            
            

            setState(() {
              for (var element in responseData['trending_movies']) {
              imgList.add(url + element['image']);
              
            }

             for (var element in responseData['categories']) {
              imgListCategories.add(url + element['image']);
              nameCategories.add(element['name']);
              
            }
              loading = false;
            });
            print(imgListCategories);
            

          
          }
     });


    },);
    // TODO: implement initState
    super.initState();
  }


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
                    name, FontWeight.w400, Colors.white, 22, "roboto"),
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
            GestureDetector(
              onTap: (){
                UserPreference().removeUser();
                goTo(context, const SignInScreen());
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 12, bottom: 12),
                child: textInfo(
                    "Log out", FontWeight.w400, Colors.white, 17, "roboto"),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        actions:  const [
          // CircleAvatar(
          //   child: GestureDetector(
          //       onTap: () {
          //         goTo(context, const ProfileScreen());
          //       },
          //       child: Image.asset("assets/images/Ellipse 1.png")),
          // ),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                        Icons.notifications,
                        color: Colors.white,
                      ),
            )
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
                       

                        textInfo("Welcome, $name", FontWeight.w600, Colors.white, 22,
                            "roboto"),
                       
                        //  textInfo("SOlomon", FontWeight.w600, Colors.white, 20,
                        //     "roboto"),
                      ],
                    ),

                     const Padding(
              padding: EdgeInsets.only(right: 0),
              child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
            )
                   
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Code for search bar
              // const SearchTool(con),
              // const SizedBox(height: 20),
              // text code
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Row(
                  children: [
                    textInfo("Trending Movies", FontWeight.w600, Colors.white,
                        22, "roboto"),
                  ],
                ),
              ),

              //  code for slidder

              const SizedBox(
                height: 20,
              ),
             loading == true ? 
             const Center(
              child: CircularProgressIndicator(),
             )
             : CarouselSlider(
                items: imageSliders(imgList, []),
                carouselController: _controller,
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: false,
                  aspectRatio: 1.0,
                  viewportFraction: 0.7,
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

              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: textInfo(
                    "Categories", FontWeight.w600, Colors.white, 22, "roboto"),
              ),
              const SizedBox(height: 15),
            loading == true ? 
               const Center(
              child: CircularProgressIndicator(),
             )
             : CarouselSlider(
                items: imageSliders(imgListCategories, nameCategories),
                carouselController: _controller,
                options: CarouselOptions(
                  autoPlay: false,
                  enlargeCenterPage: false,
                  aspectRatio: 2.5,
                  viewportFraction: 0.3,
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

             

        //       SingleChildScrollView(
        //         scrollDirection: Axis.horizontal,
        //         child: Row(
        //           children: [
                    
        //             Column(
        //               children: [
        //                   Container(
        //       margin: const EdgeInsets.only(right: 10),
        //       child: Image.asset(
        //         "assets/images/cat3.png",
        //         fit: BoxFit.fill,
        //         height: 150,
        //         width: 120,
        //       )
        //                 ),
        //                 textInfo("text", FontWeight.w400, Colors.white, 13,
        //                     "Roboto"),
        //               ],
        //             ),
                  
        //               ],
        //         ),
        //       ),
            ],
          ),
        ),
      ),
    );
  }
}
