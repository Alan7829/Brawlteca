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
    return Scaffold(
      backgroundColor: Color.fromRGBO(26, 56, 102, 1),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(5),
          child: Center(
            child: Column(children: <Widget>[
              _cardEvent(),
              _cardEvent1(),
              _cardEvent2(),
              _cardEvent3(),
              _cardEvent4()
            ]),
          )),
    );
  }
}

Widget _cardEvent() {
  return Card(
    color: Color.fromRGBO(26, 56, 102, 1),
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    child: Column(children: <Widget>[
      ClipRRect(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        child: Image.network(
          'https://brawlroyale.com/wp-content/uploads/2020/08/Modo-de-juego-atrapa-gemas.jpg',
          width: 500,
          height: 200,
        ),
      ),
    ]),
  );
}

Widget _cardEvent1() {
  return Card(
    color: Color.fromRGBO(26, 56, 102, 1),
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    child: Column(children: <Widget>[
      ClipRRect(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        child: Image.network(
          'https://cdn.ligadegamers.com/imagenes/0-supervivencia.jpg',
          width: 500,
          height: 200,
        ),
      ),
    ]),
  );
}

Widget _cardEvent2() {
  return Card(
    color: Color.fromRGBO(26, 56, 102, 1),
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    child: Column(children: <Widget>[
      ClipRRect(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        child: Image.network(
          'https://cdn.ligadegamers.com/imagenes/0-balon-brawl-0.jpg',
          width: 500,
          height: 200,
        ),
      ),
    ]),
  );
}

Widget _cardEvent3() {
  return Card(
    color: Color.fromRGBO(26, 56, 102, 1),
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    child: Column(children: <Widget>[
      ClipRRect(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        child: Image.network(
          'https://brawlroyale.com/wp-content/uploads/2020/08/Modo-de-juego-atraco.jpg',
          width: 500,
          height: 200,
        ),
      ),
    ]),
  );
}

Widget _cardEvent4() {
  return Card(
    color: Color.fromRGBO(26, 56, 102, 1),
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    child: Column(children: <Widget>[
      ClipRRect(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        child: Image.network(
          'https://cdn.ligadegamers.com/imagenes/0-caza-estelar-0.jpg',
          width: 500,
          height: 200,
        ),
      ),
    ]),
  );
}
