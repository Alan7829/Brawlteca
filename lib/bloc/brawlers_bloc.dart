// ignore_for_file: use_rethrow_when_possible, unnecessary_new

import 'dart:convert';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;

class BrawlersBloc {
  final _brawlerController = new BehaviorSubject<Map>();
  final _url = 'https://api.brawlapi.com/v1/brawlers';
  Stream<Map> get brawlersStream => _brawlerController.stream;

  Future<void> getAll() async {
    try {
      final response = await http.get(
        Uri.parse('$_url'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
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
