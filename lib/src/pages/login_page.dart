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
      backgroundColor: Color.fromRGBO(26, 56, 102, 1),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'INICIO DE SESIÓN',
                  style: TextStyle(
                      fontFamily: "nougat",
                      fontSize: 30,
                      color: Color.fromRGBO(250, 188, 59, .8)),
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
            _textFormField(context),
            Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            _btn(context),
            _btnGoogle(context)
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
        labelStyle: TextStyle(
          color: Colors.white,
          fontFamily: 'nougat',
          fontSize: 25,
        ),
        fillColor: Colors.white,
        hintStyle: TextStyle(color: Colors.grey),
      ),
      style: TextStyle(
        fontFamily: "gibson",
        color: Colors.white,
        fontSize: 20,
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
        labelStyle: TextStyle(
          color: Colors.white,
          fontFamily: 'nougat',
          fontSize: 25,
        ),
        hintStyle: TextStyle(color: Colors.grey),
      ),
      style: TextStyle(
        fontFamily: "gibson",
        color: Colors.white,
        fontSize: 20,
      ),
      obscureText: true,
    );
  }

  Widget _btn(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        'Login',
        style: TextStyle(
          fontFamily: 'nougat',
          fontSize: 25,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: Color(0xFAFABC3B), // background
        onPrimary: Colors.white, // foreground
      ),
    );
  }

  Widget _btnGoogle(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
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
