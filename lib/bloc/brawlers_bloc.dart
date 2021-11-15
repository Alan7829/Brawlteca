// ignore_for_file: use_rethrow_when_possible, unnecessary_new

import 'dart:convert';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;

class BrawlersBloc {
  final _brawlerController = new BehaviorSubject<Map>();
  final _url = 'https://api.brawlstars.com/v1/';
  final _apiToken =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6ImIwYjc3MGM2LWMwYTQtNGVkMi05MGIwLTBhZmZhZGM3YTM3NyIsImlhdCI6MTYzNjUxNTM0Niwic3ViIjoiZGV2ZWxvcGVyLzdjYjAzMzRiLWFkOWEtY2U4ZC1mNDA2LTJlNDc0MWY1NTA2YSIsInNjb3BlcyI6WyJicmF3bHN0YXJzIl0sImxpbWl0cyI6W3sidGllciI6ImRldmVsb3Blci9zaWx2ZXIiLCJ0eXBlIjoidGhyb3R0bGluZyJ9LHsiY2lkcnMiOlsiMTg3LjI1Mi4xNTQuMjA2Il0sInR5cGUiOiJjbGllbnQifV19.3I_IKiyuKgZ5k6v4P9_MIqbs-UGJeS-m3bBHcDszhObxhUJNLvdF6nqZepvI4WB0ecE31hZF_VeJz_H4OEa9Jg';
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
