import 'dart:convert';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;

class EventsBloc {
  final _eventsController = new BehaviorSubject<Map>();
  final _url = 'https://api.brawlapi.com/v1/events';
  final _apiToken =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6IjUwZmM5MjRjLTlhZmItNDJiNS05MDdjLTJmMWFiYjE2MDVhNSIsImlhdCI6MTYzNjUwODk1Mywic3ViIjoiZGV2ZWxvcGVyL2UyN2Y3Mzk3LWY2M2EtN2UwNi0xYjU4LTRjOWM2NmQ1YWRhMSIsInNjb3BlcyI6WyJicmF3bHN0YXJzIl0sImxpbWl0cyI6W3sidGllciI6ImRldmVsb3Blci9zaWx2ZXIiLCJ0eXBlIjoidGhyb3R0bGluZyJ9LHsiY2lkcnMiOlsiMTg5LjIxNC43LjE4NCJdLCJ0eXBlIjoiY2xpZW50In1dfQ.SgYtzQnxWCRyKjXXwZHdiJEoI-ijtlNdTIwYTaJuw-iyxsQDVooFMiQmKMOlc4Hac2UHfQ9Rbts5Rdz6U4xQdw';

 


  Stream<Map> get eventsStream => _eventsController.stream;

  Future<void> getAll() async {
    try {
      final response = await http.get(
        Uri.parse('${_url}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',

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
