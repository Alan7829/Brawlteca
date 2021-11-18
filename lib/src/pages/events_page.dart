import 'package:brawlteca/bloc/events_bloc.dart';
import 'package:flutter/material.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  final bloc = EventsBloc();

  @override
  Widget build(BuildContext context) {
    final scream = MediaQuery.of(context).size;
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
