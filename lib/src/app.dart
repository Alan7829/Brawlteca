// ignore_for_file: prefer_const_constructors

import 'package:brawlteca/src/pages/login_page.dart';
import 'package:brawlteca/src/pages/main_page.dart';
import 'package:brawlteca/src/pages/splash_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      initialRoute: "splash",
      routes: {
        "splash": (_) => SplashScreen(),
        "login": (_) => LoginPage(),
        "main": (_) => MainPage(),
      },
    );
  }
}
