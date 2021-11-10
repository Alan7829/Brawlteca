// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:brawlteca/bloc/brawlers_bloc.dart';
import 'package:brawlteca/widgets/text_border.dart';
import 'package:flutter/material.dart';

class WikiPage extends StatefulWidget {
  const WikiPage({Key? key}) : super(key: key);

  @override
  _WikiPageState createState() => _WikiPageState();
}

class _WikiPageState extends State<WikiPage> {
  final bloc = BrawlersBloc();
  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () => bloc.getAll(),
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
          color: Color.fromRGBO(26, 56, 102, 1),
          child: Column(
            children: <Widget>[
              Text(
                'Lista de Brawlers',
                style: TextStyle(
                  color: Color.fromRGBO(250, 188, 59, .8),
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  fontFamily: "nougat",
                ),
              ),
              SizedBox(),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        TextBorderWidget(
                          text: "Brawler",
                          fontSize: 17,
                          colorFore: Color.fromRGBO(115, 203, 241, 1),
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              TextBorderWidget(
                                text: "Win Rate",
                                fontSize: 17,
                                colorFore: Color.fromRGBO(115, 203, 241, 1),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              TextBorderWidget(
                                text: "Pick Rate",
                                fontSize: 17,
                                colorFore: Color.fromRGBO(115, 203, 241, 1),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    StreamBuilder(
                      stream: bloc.brawlersStream,
                      builder:
                          (BuildContext context, AsyncSnapshot<Map> snapshot) {
                        if (!snapshot.hasData) bloc.getAll();
                        if (snapshot.hasData) {
                          final data = snapshot.data!['items'];
                          return Container(
                            height: screen.height * 0.698,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: data.length,
                              itemBuilder: (_, int idx) {
                                int _brawlId = data[idx]['id'];
                                return Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(14, 95, 176, 1),
                                    border: Border.all(
                                      color: Color.fromRGBO(2, 28, 108, 1),
                                      style: BorderStyle.solid,
                                      width: 2.5,
                                    ),
                                  ),
                                  child: ListTile(
                                    leading: Icon(Icons.image),
                                    minLeadingWidth: .5,
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          data[idx]['name'],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "nougat",
                                            fontSize: 20,
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text(
                                                '67%',
                                                style: TextStyle(
                                                    fontFamily: "nougat",
                                                    fontSize: 20),
                                              ),
                                              SizedBox(
                                                width: 30,
                                              ),
                                              Text(
                                                '3.1%',
                                                style: TextStyle(
                                                    fontFamily: "nougat",
                                                    fontSize: 20),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        }
                        return Center(child: CircularProgressIndicator());
                      },
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
