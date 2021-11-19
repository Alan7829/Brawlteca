import 'package:brawlteca/bloc/events_bloc.dart';
import 'package:flutter/material.dart';
import 'package:brawlteca/widgets/text_border.dart';
import 'package:intl/intl.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  final bloc = EventsBloc();

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
                'Eventos',
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
                          text: "Eventos Actuales",
                          fontSize: 17,
                          colorFore: Color.fromRGBO(115, 203, 241, 1),
                        ),
                      ],
                    ),
                    StreamBuilder(
                      stream: bloc.eventsStream,
                      builder:
                          (BuildContext context, AsyncSnapshot<Map> snapshot) {
                        if (!snapshot.hasData) bloc.getAll();
                        if (snapshot.hasData) {
                          final data = snapshot.data!['active'];

                          return Container(
                            height: screen.height * 0.698,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: data.length,
                              itemBuilder: (_, int idx) {
                                // int _brawlId = data[idx]['id'];
                                return SizedBox(
                             

                                  child: Card(
                                    
                                    
                                    
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: BorderSide(color: Colors.white, width: 2),
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
                                                  fontSize: 25,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                data[idx]['map']['gameMode']
                                                    ['name'],
                                                style: TextStyle(
                                                  fontFamily: "nougat",
                                                  fontSize: 35,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                data[idx]['map']['name'],
                                                style: TextStyle(
                                                  fontFamily: "nougat",
                                                  fontSize: 25,
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
