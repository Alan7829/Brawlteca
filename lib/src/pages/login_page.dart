// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unnecessary_new

import 'package:flutter/material.dart';
import 'package:brawlteca/bloc/login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final login = LoginBloc();
  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(26, 56, 102, 1),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/brawlers.png',
                  scale: 1,
                  width: screen.width * 0.7,
                  height: screen.height * 0.27,
                ),
                Text(
                  'INICIO DE SESIÓN',
                  style: TextStyle(
                    fontFamily: "nougat",
                    fontSize: 30,
                    color: Color.fromRGBO(250, 188, 59, .8),
                  ),
                ),
                _widgetsSignIn(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _widgetsSignIn(BuildContext context) => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            _btnGoogle(context)
          ],
        ),
      );

  Widget _btnGoogle(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final result = await login.signInGoogle();
        print("DATA: ${result}");
        if (result) {
          Navigator.of(context).pushReplacementNamed("main");
        } else {
          final scaffold = ScaffoldMessenger.maybeOf(context);

          scaffold!
              .showSnackBar(SnackBar(content: Text("Error al iniciar sesión")));
        }
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          new Image.asset(
            'assets/google.jpg',
            height: 40.0,
            width: 50.0,
          ),
          Padding(padding: const EdgeInsets.only(right: 20.0)),
          Text(
            'Login with Google',
            style: TextStyle(
              fontFamily: 'nougat',
              fontSize: 22,
            ),
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
        primary: Color(0xFF4285F4), // background
        onPrimary: Colors.white, // foreground
      ),
    );
  }
}
