// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:brawlteca/bloc/events_bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CurrentEventsPage extends StatefulWidget {
  const CurrentEventsPage({Key? key}) : super(key: key);

  @override
  _CurrentEventsPage createState() => _CurrentEventsPage();
}

class _CurrentEventsPage extends State<CurrentEventsPage> {
  final bloc = EventsBloc();

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () => bloc.getAll(),
        child: Container(
          color: Color.fromRGBO(26, 56, 102, 1),
          child: Column(
            children: <Widget>[
              SizedBox(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  children: <Widget>[
                    StreamBuilder(
                      stream: bloc.eventsStream,
                      builder:
                          (BuildContext context, AsyncSnapshot<Map> snapshot) {
                        if (!snapshot.hasData) bloc.getAll();
                        if (snapshot.hasData) {
                          final data = snapshot.data!['active'];
                          return Container(
                            height: screen.height * 0.77,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: data.length,
                              itemBuilder: (_, int idx) {
                                return SizedBox(
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: BorderSide(
                                          color: Colors.white, width: 2),
                                    ),
                                    color: Color(int.parse(
                                            data[idx]['map']['gameMode']
                                                    ['color']
                                                .substring(1, 7),
                                            radix: 16) +
                                        0xFF000000),
                                    elevation: 1,
                                    child: Column(children: <Widget>[
                                      Row(
                                        children: [
                                          //imagen
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 12.0),
                                          ),
                                          ClipRRect(
                                            child: Image.network(
                                              data[idx]['map']['gameMode']
                                                  ['imageUrl'],
                                              width: 70,
                                              height: 70,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 12.0),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Termina " +
                                                    DateFormat('yyyy-MM-dd')
                                                        .format(DateTime.parse(
                                                            data[idx]
                                                                ['endTime'])),
                                                style: TextStyle(
                                                  fontFamily: "nougat",
                                                  fontSize: 23,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                data[idx]['map']['gameMode']
                                                    ['name'],
                                                style: TextStyle(
                                                  fontFamily: "nougat",
                                                  fontSize: 30,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                data[idx]['map']['name'],
                                                style: TextStyle(
                                                  fontFamily: "nougat",
                                                  fontSize: 23,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      ClipRRect(
                                        child: Image.network(
                                          data[idx]['map']['environment']
                                              ['imageUrl'],
                                          width: 500,
                                        ),
                                      ),
                                    ]),
                                  ),
                                );
                              },
                            ),
                          );
                        }
                        return Center(child: CircularProgressIndicator());
                      },
                    ),
                    Card(),
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
