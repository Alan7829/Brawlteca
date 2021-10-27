// ignore_for_file: prefer_const_constructors

import 'package:brawlteca/src/pages/main_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "main",
      routes: {
        "main": (_) => MainPage(),
      },
    );
  }
}
