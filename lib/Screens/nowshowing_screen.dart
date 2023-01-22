import 'dart:convert';

import 'package:cinmatick/Screens/book_ticket_screen.dart';
import 'package:cinmatick/Services/navigate_help.dart';
import 'package:cinmatick/Widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Provider/get_data.dart';
import '../preference/user_preference.dart';
import '../util/http_service.dart';

class NowShowingScreen extends StatefulWidget {
  const NowShowingScreen({super.key});

  @override
  State<NowShowingScreen> createState() => _NowShowingScreenState();
}

class _NowShowingScreenState extends State<NowShowingScreen> {

  String token = "";

  final String url = "https://cinmatick.ictyepprojects.com/storage/";

 

  bool loading = true;

   List<dynamic> _allUsers = [
    // {"id": 1, "name": "Andy", "age": 29},
    // {"id": 2, "name": "Aragon", "age": 40},
    // {"id": 3, "name": "Bob", "age": 5},
    // {"id": 4, "name": "Barbara", "age": 35},
    // {"id": 5, "name": "Candy", "age": 21},
    // {"id": 6, "name": "Colin", "age": 55},
    // {"id": 7, "name": "Audra", "age": 30},
    // {"id": 8, "name": "Banana", "age": 14},
    // {"id": 9, "name": "Caversky", "age": 100},
    // {"id": 10, "name": "Becky", "age": 32},
  ];

  // This list holds the data for the list view
  List<dynamic> _foundUsers = [];

    @override
  initState() {
    // at the beginning, all users are shown
    
     UserPreference().getUser().then((value) {
      token = value.token;

       GetDataProvider().getData(HttpService.showSearch, token).then((response) {
       final Map<String, dynamic> responseData = json.decode(response.body);

          if(response.statusCode == 200){

          
            setState(() {
             _allUsers = responseData['shows']['data'];
              _foundUsers = _allUsers;
              loading = false;
            });
          
             print(_allUsers);

          
          }
     });


    },);

   
    super.initState();
  }

   void _runFilter(String enteredKeyword) {
    List<dynamic> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
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
                decoration:  InputDecoration(
                  enabledBorder:   OutlineInputBorder(
                  borderRadius:  BorderRadius.circular(25.0),
                  borderSide: const  BorderSide(color: Colors.white ),

                ),
                focusedBorder:  OutlineInputBorder(
                  borderRadius:  BorderRadius.circular(25.0),
                  borderSide:  const BorderSide(color: Colors.white ),

                ),
                  border: const OutlineInputBorder(
                    borderSide:  BorderSide(color: Colors.white, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(25))
                  ),
                 labelStyle: textStyle(FontWeight.normal, Colors.white, 16),
                    labelText: 'Search', suffixIcon: const Icon(Icons.search, color: Colors.white,)),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(height: 10),
              loading == true ? 
             const Center(
              child: CircularProgressIndicator(
                color: Colors.redAccent,
              ),
             )
             :
              Expanded(
              child: _foundUsers.isNotEmpty
                  ? ListView.builder(
                      itemCount: _foundUsers.length,
                      itemBuilder: (context, index) => 
                      Card(
                        key: ValueKey(_foundUsers[index]["id"]),
                        color: Colors.redAccent,
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: 
                   
              ListTile(
                onTap: () {
                  goTo(context,  BookTicket(
                    id: _foundUsers[index]["id"],
                    name: _foundUsers[index]["name"],
                    rating: _foundUsers[index]["rating"],
                    description: _foundUsers[index]["description"],
                    image: url + _foundUsers[index]["image"],
                    date: _foundUsers[index]["released_date"],
                    pg: _foundUsers[index]["pg"],
                  ));
                },
                          leading:  
                          Container(
                          width: 70,
                           height: 70,
                        child: Image.network(
                          url + _foundUsers[index]['image'],
                          fit: BoxFit.fill,
                          // height: 400,
                          // width: 200,
                        ),
                      ),  
                          title: textInfo(_foundUsers[index]['name'], FontWeight.bold, Colors.white, 16, ""),
                          subtitle: 
                          textInfo(_foundUsers[index]["description"], FontWeight.bold, Colors.white, 13, ""),
                          trailing: 
                          textInfo(_foundUsers[index]["released_date"], FontWeight.bold, Colors.white, 13, ""),

                        
                        ),
                      )
                  )
                  : textInfo('No results found', FontWeight.bold, Colors.white, 20, "")
              
                    ),
            
 ],
          ),
        ),
      ),
    );
  }
}
