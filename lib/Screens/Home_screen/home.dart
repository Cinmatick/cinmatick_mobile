import 'package:cinmatick/Screens/Home_screen/home_screen1.dart';
import 'package:cinmatick/Screens/myticket_screen.dart';
import 'package:cinmatick/Screens/profile_screen.dart';

import 'package:flutter/material.dart';

import '../nowshowing_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final _widgetOptions = [
    const HomeScreen1(),
    const NowShowingScreen(),
    const MyTicketScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        enableFeedback: false,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedLabelStyle: const TextStyle(color: Colors.white),
        selectedLabelStyle:
            const TextStyle(color: Color.fromRGBO(210, 78, 0, 1)),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              backgroundColor: const Color.fromARGB(255, 93, 93, 102),
              icon: Icon(Icons.home,
                  color: _selectedIndex == 0
                      ? const Color.fromRGBO(210, 78, 0, 1)
                      : Colors.white),
              label: 'Home'),
          BottomNavigationBarItem(
              backgroundColor: const Color.fromARGB(255, 93, 93, 102),
              icon: Icon(Icons.play_arrow,
                  color: _selectedIndex == 1
                      ? const Color.fromRGBO(210, 78, 0, 1)
                      : Colors.white),
              label: 'Now showing'),
          BottomNavigationBarItem(
            backgroundColor: const Color.fromARGB(255, 93, 93, 102),
            icon: Icon(Icons.airplane_ticket,
                color: _selectedIndex == 2
                    ? const Color.fromRGBO(210, 78, 0, 1)
                    : Colors.white),
            label: 'My Ticket',
          ),
          BottomNavigationBarItem(
              backgroundColor: const Color.fromARGB(255, 93, 93, 102),
              icon: Icon(Icons.account_circle,
                  color: _selectedIndex == 3
                      ? const Color.fromRGBO(210, 78, 0, 1)
                      : Colors.white),
              label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
