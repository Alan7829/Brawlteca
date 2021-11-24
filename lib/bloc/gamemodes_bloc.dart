// ignore_for_file: unnecessary_new, use_rethrow_when_possible

import 'dart:convert';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;

class GameModesBloc {
  final _gameModesController = new BehaviorSubject<Map>();
  final _url = 'https://api.brawlapi.com/v1/gamemodes';
  Stream<Map> get gameModesStream => _gameModesController.stream;

  Future<void> getAll() async {
    try {
      final response = await http.get(
        Uri.parse(_url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      final gameModes = jsonDecode(response.body);
      // print('Body: ${response.body}');
      _gameModesController.sink.add(gameModes);
    } catch (e) {
      throw e;
    }
  }
}
