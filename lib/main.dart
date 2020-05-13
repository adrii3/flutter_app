import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/emailPage.dart';
import 'package:flutterapp/signin_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  @override
  State<MyApp> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp>{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Puig Incidències',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Login(

      ),
    );
  }
}


class Login extends StatefulWidget {
  final String title;

  Login({Key key, this.title}) : super(key: key);

  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio de sesión'),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                icon: Icon(Icons.email)
              ),
            ),
            SizedBox(height: 15.0,),
            FlatButton(
              child: Text('Login'),
              color: Colors.orangeAccent,
              textColor: Colors.white,
              onPressed: (){
                FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: emailController.text,
                  password: passwordController.text,
                ).then((FirebaseUser user){
                  Navigator.of(context).pushReplacement(CupertinoPageRoute(
                    builder: (context) => EmailPantalla(),
                  ));
                }).catchError((e){
                  print(e);
                });
              },
            ),
            VerticalDivider(),
            FlatButton(
              child: Text('Registro'),
              color: Colors.green,
              textColor: Colors.white,
              onPressed: ()=> _pushPage(context,SignInPage()),
            ),
          ],
        ),
      ),
    );
  }

  void _pushPage(BuildContext context, Widget page){
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }
}




