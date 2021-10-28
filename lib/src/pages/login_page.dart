import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _userPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('INICIO DE SESIÓN'),
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
            _textFormField(context),
            Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            _btn(context),
          ],
        ),
      );

  Widget _textFormField(BuildContext context) {
    return Container(
      child: Form(
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.symmetric(vertical: 20)),
            _email(context),
            Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            _pass(context),
          ],
        ),
      ),
    );
  }

  Widget _email(BuildContext context) {
    return TextFormField(
      controller: _userEmailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.email_outlined,
          color: Colors.black,
          size: 10,
        ),
        hintText: 'ejemplo@correo.com',
        labelText: 'Email',
      ),
      style: TextStyle(
        fontFamily: "gibson",
      ),
      obscureText: false,
    );
  }

  Widget _pass(BuildContext context) {
    return TextFormField(
      controller: _userPasswordController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.email_outlined,
          color: Colors.black,
          size: 10,
        ),
        hintText: 'Contraseña',
        labelText: 'Contraseña',
      ),
      style: TextStyle(
        fontFamily: "gibson",
      ),
      obscureText: true,
    );
  }

  Widget _btn(BuildContext context) {
    return ElevatedButton(onPressed: () {}, child: Text('Inicia sesión'));
  }
}