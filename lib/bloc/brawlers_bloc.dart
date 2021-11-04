// ignore_for_file: use_rethrow_when_possible, unnecessary_new

import 'dart:convert';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;

class BrawlersBloc {
  final _brawlerController = new BehaviorSubject<Map>();
  final _url = 'https://api.brawlstars.com/v1/';
  final _apiToken =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6ImZhZGM5MTM1LWQ5MTktNDI0ZS04MGViLWE0NWZkZmIyZmI3NCIsImlhdCI6MTYzNTgxMDUyMywic3ViIjoiZGV2ZWxvcGVyLzE5NWMxOWMyLTI1YzgtYmIyMy1jOTgyLWRkYjA3MzJkNzJiMCIsInNjb3BlcyI6WyJicmF3bHN0YXJzIl0sImxpbWl0cyI6W3sidGllciI6ImRldmVsb3Blci9zaWx2ZXIiLCJ0eXBlIjoidGhyb3R0bGluZyJ9LHsiY2lkcnMiOlsiMC4wLjAuMCIsIjE4OS4yMTQuNC40OSJdLCJ0eXBlIjoiY2xpZW50In1dfQ.WHYkgO_R5XCNHZ0UCpWW2XJMaLUOEvTUxLc3OWnHCtQaBZvp8X9uAIEJeM3hAr-5hOLMcbOUGADA6aEpEFLyeQ';
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
      print('STATUS: ${response.statusCode}');
      print('BODY: ${response.body}');
      _brawlerController.sink.add(brawlers);
    } catch (e) {
      throw e;
    }
  }
}
