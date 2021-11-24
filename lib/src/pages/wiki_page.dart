// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:brawlteca/bloc/brawlers_bloc.dart';
import 'package:brawlteca/src/pages/brawlers_page.dart';
import 'package:brawlteca/src/pages/gamemodes_page.dart';
import 'package:brawlteca/widgets/text_border.dart';
import 'package:flutter/material.dart';

class WikiPage extends StatefulWidget {
  const WikiPage({Key? key}) : super(key: key);

  @override
  _WikiPageState createState() => _WikiPageState();
}

class _WikiPageState extends State<WikiPage> with TickerProviderStateMixin {
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
                'Lista de Brawlers',
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
                'Modos de juego',
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
            BrawlersPage(),
            GameModesPages(),
          ],
        ),
      ),
    );
  }
}
