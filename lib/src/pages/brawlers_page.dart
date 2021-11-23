// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:brawlteca/bloc/brawlers_bloc.dart';
import 'package:brawlteca/widgets/text_border.dart';
import 'package:flutter/material.dart';

class BrawlersPage extends StatefulWidget {
  const BrawlersPage({Key? key}) : super(key: key);

  @override
  _BrawlersPageState createState() => _BrawlersPageState();
}

class _BrawlersPageState extends State<BrawlersPage> {
  final bloc = BrawlersBloc();

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () => bloc.getAll(),
        child: Container(
          // margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
          color: Color.fromRGBO(26, 56, 102, 1),
          child: Column(
            children: <Widget>[
              SizedBox(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Column(
                  children: <Widget>[
                    StreamBuilder(
                      stream: bloc.brawlersStream,
                      builder:
                          (BuildContext context, AsyncSnapshot<Map> snapshot) {
                        if (!snapshot.hasData) bloc.getAll();
                        if (snapshot.hasData) {
                          final data = snapshot.data!['list'];
                          return Container(
                            height: screen.height * 0.77,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: data.length,
                              itemBuilder: (_, int idx) {
                                // int _brawlId = data[idx]['id'];
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
                                    // leading: Icon(Icons.image),
                                    // minLeadingWidth: .5,
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        'brawl',
                                        arguments: data[idx]['id'],
                                      );
                                    },
                                    title: TextBorderWidget(
                                      text: data[idx]['name'],
                                      colorFore: Colors.white,
                                      fontSize: 18,
                                    ),
                                    subtitle: Container(
                                      child: Column(
                                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              TextBorderWidget(
                                                text: "Rarity: ",
                                                fontSize: 17,
                                                colorFore: Color.fromRGBO(
                                                    115, 203, 241, 1),
                                              ),
                                              Text(
                                                data[idx]['rarity']['name'],
                                                style: TextStyle(
                                                  fontFamily: "nougat",
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              TextBorderWidget(
                                                text: "Class: ",
                                                fontSize: 17,
                                                colorFore: Color.fromRGBO(
                                                    115, 203, 241, 1),
                                              ),
                                              Text(
                                                data[idx]['class']['name'],
                                                style: TextStyle(
                                                  fontFamily: "nougat",
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    trailing: Image.network(
                                      data[idx]['imageUrl'],
                                      scale: 1,
                                      width: 50,
                                      height: 50,
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
