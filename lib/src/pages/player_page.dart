// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables
import 'dart:ui';

import 'package:brawlteca/bloc/login_bloc.dart';
import 'package:brawlteca/tools/shared_preferences.dart';
import 'package:brawlteca/widgets/text_border.dart';
import 'package:flutter/material.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage({Key? key}) : super(key: key);

  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  final _prefs = PreferenciasUsuario.instance;
  final log = LoginBloc();

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final name = _prefs.nombre;
    final foto = _prefs.foto;
    final email = _prefs.email;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(26, 56, 102, 1),
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.asset(
              'assets/logo-bt.png',
            ),
          ),
          backgroundColor: Color.fromRGBO(26, 56, 102, 1),
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: <Widget>[
            Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    log.signOut();
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Cerrar sesión',
                        style: TextStyle(
                          color: Colors.red[600],
                          fontWeight: FontWeight.bold,
                          fontFamily: "Nougat",
                          fontSize: 20,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5, left: 3),
                        child: Icon(
                          Icons.logout_outlined,
                          color: Colors.red[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            Container(
              height: screen.height * 0.40,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Card(
                color: Color.fromRGBO(115, 203, 241, .6),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.network(
                              foto,
                              fit: BoxFit.contain,
                              height: 150,
                              width: 150,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Bievenido a",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: "Nougat",
                                    color: Color.fromRGBO(250, 188, 59, .8),
                                  ),
                                ),
                                TextBorderWidget(
                                  text: 'Brawlteca',
                                  fontSize: 29,
                                  colorBack: Colors.white,
                                  colorFore: Color.fromRGBO(0, 95, 176, 1),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '$name',
                            style: TextStyle(
                              color: Color.fromRGBO(250, 188, 59, .8),
                              fontFamily: "Nougat",
                              fontSize: 24,
                            ),
                          ),
                          TextBorderWidget(
                            text: email,
                            fontSize: 23,
                            colorBack: Colors.white,
                            colorFore: Color.fromRGBO(0, 95, 176, 1),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: Image.asset(
                'assets/saludo.png',
                width: 290,
                height: 290,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
