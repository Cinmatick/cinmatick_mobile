import 'dart:convert';

import 'package:cinmatick/Widgets/text_widget.dart';
import 'package:flutter/material.dart';

import '../Provider/get_data.dart';
import '../preference/user_preference.dart';
import '../util/http_service.dart';

class MyTicketScreen extends StatefulWidget {
  const MyTicketScreen({super.key});

  @override
  State<MyTicketScreen> createState() => _NowShowingScreenState();
}

class _NowShowingScreenState extends State<MyTicketScreen> {
  String token = "";

  final String url = "https://cinmatick.ictyepprojects.com/storage/";

  bool loading = true;

  List<dynamic> _allUsers = [];

  // This list holds the data for the list view
  List<dynamic> _foundUsers = [];

  @override
  initState() {
    // at the beginning, all users are shown

    UserPreference().getUser().then(
      (value) {
        token = value.token;

        GetDataProvider()
            .getData(HttpService.bookedShows, token)
            .then((response) {
          final Map<String, dynamic> responseData = json.decode(response.body);

          if (response.statusCode == 200) {
            setState(() {
              _allUsers = responseData['shows'];
              _foundUsers = _allUsers;
              loading = false;
            });
          }
        });
      },
    );

    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<dynamic> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) => user["reference"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              TextField(
                onChanged: (value) => _runFilter(value),
                style: textStyle1(FontWeight.normal, Colors.white, 16),
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    labelStyle: textStyle(FontWeight.normal, Colors.white, 16),
                    labelText: 'Search',
                    suffixIcon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(height: 10),
              loading == true
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.redAccent,
                      ),
                    )
                  : Expanded(
                      child: _foundUsers.isNotEmpty
                          ? ListView.builder(
                              itemCount: _foundUsers.length,
                              itemBuilder: (context, index) => Card(
                                    // key: ValueKey(_foundUsers[index]["id"]),
                                    color: Colors.redAccent,
                                    elevation: 4,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: ListTile(
                                      onTap: () {
                                        // print(_foundUsers[index]['show'][0]['price']);
                                        // goTo(context,  BookTicket(
                                        //   id: _foundUsers[index]["id"],
                                        //   name: _foundUsers[index]["name"],
                                        //   rating: _foundUsers[index]["rating"],
                                        //   description: _foundUsers[index]["description"],
                                        //   image: url + _foundUsers[index]["image"],
                                        //   date: _foundUsers[index]["released_date"],
                                        //   pg: _foundUsers[index]["cast"],
                                        //   price: _foundUsers[index]['show'][0]['price'],
                                        //   theatre_id: _foundUsers[index]['show'][0]['theatre_id'],
                                        //   show_id: _foundUsers[index]['show'][0]['id'],
                                        // ));
                                      },
                                      //     leading:
                                      //     Container(
                                      //     width: 70,
                                      //      height: 70,
                                      //   child: Image.network(
                                      //     url + _foundUsers[index]['image'],
                                      //     fit: BoxFit.fill,
                                      //     // height: 400,
                                      //     // width: 200,
                                      //   ),
                                      // ),
                                      title: textInfo(
                                          _foundUsers[index]['reference'],
                                          FontWeight.bold,
                                          Colors.white,
                                          16,
                                          ""),
                                      subtitle: textInfo(
                                          "No. of Seat ${_foundUsers[index]["number_of_seats"]}\nPrice per seat NGN${_foundUsers[index]["show"]["price"]}",
                                          FontWeight.bold,
                                          Colors.white,
                                          13,
                                          ""),
                                      trailing: textInfo(
                                          _foundUsers[index]["show"]["date"] +
                                              "\n" +
                                              _foundUsers[index]["show"]
                                                  ["time"],
                                          FontWeight.bold,
                                          Colors.white,
                                          13,
                                          ""),
                                    ),
                                  ))
                          : textInfo('No results found', FontWeight.bold,
                              Colors.white, 20, "")),
            ],
          ),
        ),
      ),
    );
  }
}
