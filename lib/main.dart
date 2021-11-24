// ignore_for_file: prefer_const_constructors

import 'package:brawlteca/src/app.dart';
import 'package:brawlteca/tools/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  final prefs = PreferenciasUsuario.instance;
  runApp(MyApp());
  await Firebase.initializeApp();
  await prefs.initPrefs();
}
