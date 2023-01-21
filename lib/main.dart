import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
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
        home: const SplashScreen(),
      ),
    );
  }
}
