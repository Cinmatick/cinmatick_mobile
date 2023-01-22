import 'package:cinmatick/Provider/get_data.dart';
import 'package:cinmatick/Screens/Home_screen/home.dart';
import 'package:cinmatick/Screens/Home_screen/home_screen1.dart';
import 'package:cinmatick/preference/user_preference.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Models/user.dart';
import 'Provider/auth_provider.dart';
import 'Provider/user_provider.dart';
import 'Screens/SplashScreen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    Future<User> getuserData() => UserPreference().getUser();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => GetDataProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cinmatick',
        theme: ThemeData(
          // bottomAppBarColor: Color.fromARGB(255, 41, 41, 44),
          scaffoldBackgroundColor: const Color.fromARGB(255, 41, 41, 44),
          appBarTheme: const AppBarTheme(
            elevation: 0,
            backgroundColor: Color.fromARGB(255, 41, 41, 44),
          ),
          primarySwatch: Colors.blue,
        ),
        home: FutureBuilder(
      future: getuserData(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return const CircularProgressIndicator();
            
          default:
            // print(snapshot.data);
            if(snapshot.hasError){
              return Text('Error: ${snapshot.error}' );
            }else if(snapshot.data!.token == "null"){
              return const SplashScreen();
              }else{
              // UserPreference().removeUser();
              // User user = User(name: snapshot.data!.name, token: snapshot.data!.token);
              // print(snapshot.data!.token);
              // userProvider.setUser(user);
              return  const HomeScreen();
            }
        }
      }
      ),
    ));
  }
}
