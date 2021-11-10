// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables
import 'dart:ui';

import 'package:brawlteca/widgets/text_border.dart';
import 'package:flutter/material.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage({Key? key}) : super(key: key);

  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        height: screen.height * 0.5,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            tileMode: TileMode.clamp,
            end: Alignment.center,
            begin: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(0, 163, 254, .1),
              Color.fromRGBO(0, 138, 229, .3),
              Color.fromRGBO(0, 122, 205, .8),
            ],
          ),
        ),
        child: Container(
          child: Stack(
            children: <Widget>[
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/brawlers.png',
                      scale: 1,
                      width: screen.width * 0.7,
                      height: screen.height * 0.27,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0, bottom: 20.0),
                      child: TextBorderWidget(
                        text: "Ingresa el tag de usuario",
                        fontSize: 20,
                        colorFore: Colors.white,
                        // colorBack: Colors.black,
                      ),
                    ),
                    Container(
                      width: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          width: 2,
                          color: Colors.black,
                        ),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "#XXXXXXXX",
                          hintStyle: TextStyle(
                            fontSize: 18,
                            fontFamily: "nougat",
                            color: Colors.grey[600],
                          ),
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon: IconButton(
                            onPressed: () {},
                            color: Colors.black,
                            hoverColor: Colors.black,
                            icon: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
