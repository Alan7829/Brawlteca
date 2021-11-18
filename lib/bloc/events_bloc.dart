import 'dart:convert';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;

class EventsBloc {
  final _eventsController = new BehaviorSubject<Map>();
  final _url = 'https://api.brawlapi.com/v1/events/';

  Stream<Map> get eventsStream => _eventsController.stream;

  Future<void> getAll() async {
    try {
      final response = await http.get(
        Uri.parse('${_url}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          //'Authorization': 'Bearer $_apiToken',
        },
      );
      final events = jsonDecode(response.body);
      //print('STATUS: ${response.statusCode}');
      //print('BODY: ${response.body}');
      _eventsController.sink.add(events);
    } catch (e) {
      throw e;
    }
  }
}
