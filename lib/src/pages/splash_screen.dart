// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      Duration(milliseconds: 3200),
      () => Navigator.pushReplacementNamed(context, "login"),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(26, 56, 102, 1),
      body: Stack(
        children: <Widget>[
          _splashScreen(),
          Positioned(top: -30.0, right: -40.0, child: _circle1()),
          Positioned(top: 60.0, right: 60.0, child: _circle2()),
          Positioned(top: 105.0, right: 35.0, child: _circle3()),
          Positioned(top: 210.0, left: 35.0, child: _circle4()),
          Positioned(bottom: -110.0, left: -90.0, child: _circle5()),
          Positioned(bottom: 110.0, right: -80.0, child: _circle6()),
        ],
      ),
    );
  }

  Widget _splashScreen() {
    return Center(
      child: Stack(
        children: <Widget>[
          SafeArea(
            top: true,
            bottom: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _logo(context),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _logo(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: Image.asset(
        'assets/logo.png',
        width: 600,
        height: 600,
      ),
    );
  }

  Widget _circle1() {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(72, 189, 150, 1),
      ),
    );
  }

  Widget _circle2() {
    return Container(
      width: 85.0,
      height: 85.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(250, 188, 59, .8),
      ),
    );
  }

  Widget _circle3() {
    return Container(
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(20, 108, 156, .7),
      ),
    );
  }

  Widget _circle4() {
    return Container(
      width: 60.0,
      height: 60.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(70, 185, 97, 0.4),
      ),
    );
  }

  Widget _circle5() {
    return Container(
      width: 200.0,
      height: 200.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(250, 188, 59, .8),
      ),
    );
  }

  Widget _circle6() {
    return Container(
      width: 150.0,
      height: 150.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(250, 188, 59, .6),
      ),
    );
  }
}
