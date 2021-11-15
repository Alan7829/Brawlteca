// ignore_for_file: use_rethrow_when_possible, unnecessary_new

import 'dart:convert';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;

class BrawlersBloc {
  final _brawlerController = new BehaviorSubject<Map>();
  final _url = 'https://api.brawlstars.com/v1/';
  final _apiToken =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6IjU4ZmM1MTFiLWQ1ZmItNDhiMi05MzA2LTFjNzYxNDg2OWY2ZiIsImlhdCI6MTYzNjU3MDk2Mywic3ViIjoiZGV2ZWxvcGVyLzE5NWMxOWMyLTI1YzgtYmIyMy1jOTgyLWRkYjA3MzJkNzJiMCIsInNjb3BlcyI6WyJicmF3bHN0YXJzIl0sImxpbWl0cyI6W3sidGllciI6ImRldmVsb3Blci9zaWx2ZXIiLCJ0eXBlIjoidGhyb3R0bGluZyJ9LHsiY2lkcnMiOlsiMTg5LjIxNC42LjIwMSJdLCJ0eXBlIjoiY2xpZW50In1dfQ.ABXlcKGjM9AQP_KFf2vX6NPmf6ELBkagM-8LON8GT9u_m4whGzRG7sxxNogdXAEivcBavtyHCYv1Z6oEonJUUg';
  Stream<Map> get brawlersStream => _brawlerController.stream;

  Future<void> getAll() async {
    try {
      final response = await http.get(
        Uri.parse('${_url}brawlers?limit=20'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $_apiToken',
        },
      );
      final brawlers = jsonDecode(response.body);
      // print('STATUS: ${response.statusCode}');
      // print('BODY: ${response.body}');
      _brawlerController.sink.add(brawlers);
    } catch (e) {
      throw e;
    }
  }
}
