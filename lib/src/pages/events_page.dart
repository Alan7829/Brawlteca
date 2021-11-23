// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:brawlteca/src/pages/brawlers_page.dart';
import 'package:brawlteca/src/pages/current_events_page.dart';
import 'package:brawlteca/src/pages/gamemodes_page.dart';
import 'package:brawlteca/src/pages/upcoming_events_page.dart';
import 'package:flutter/material.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(26, 56, 102, 1),
        appBar: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              child: Text(
                'Eventos Actuales',
                style: TextStyle(
                  color: Color.fromRGBO(250, 188, 59, .8),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  fontFamily: "nougat",
                ),
              ),
            ),
            Tab(
              child: Text(
                'Eventos Próximos',
                style: TextStyle(
                  color: Color.fromRGBO(250, 188, 59, .8),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  fontFamily: "nougat",
                ),
              ),
            ),
          ],
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            CurrentEventsPage(),
            UpcomingEventsPage(),
          ],
        ),
      ),
    );
  }
}
