// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:brawlteca/src/pages/events_page.dart';
import 'package:brawlteca/src/pages/home_page.dart';
import 'package:brawlteca/src/pages/player_page.dart';
import 'package:brawlteca/src/pages/wiki_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(26, 56, 102, 1),
      body: _callPage(_currentIndex),
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Color.fromRGBO(26, 56, 102, 1),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 17,
                color: Colors.black,
                spreadRadius: .7,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              child: BottomNavigationBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                type: BottomNavigationBarType.fixed,
                // landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                selectedItemColor: Color.fromRGBO(250, 188, 59, .8),
                unselectedItemColor: Colors.grey,
                currentIndex: _currentIndex,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined),
                    activeIcon: Icon(Icons.home),
                    label: 'Inicio',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.book_outlined),
                    activeIcon: Icon(Icons.book_rounded),
                    label: 'Wiki',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.calendar_today_outlined),
                    activeIcon: Icon(Icons.calendar_today),
                    label: 'Eventos',
                  ),
                  // BottomNavigationBarItem(
                  //   icon: Icon(Icons.home),
                  //   activeIcon: Icon(Icons.home),
                  //   label: 'Inicio',
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _callPage(int currentPage) {
    switch (currentPage) {
      case 0:
        return const PlayerPage();
      case 1:
        return const WikiPage();
      case 2:
        return const EventsPage();

      default:
        return const HomePage();
    }
  }
}
