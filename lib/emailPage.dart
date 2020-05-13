import 'package:flutter/material.dart';

class EmailPantalla extends StatefulWidget{
  final Widget child;

  EmailPantalla({Key key, this.child}) : super(key: key);

  _EmailScreenState createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailPantalla>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Email Auth'),
      ),
      body: Column(
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.all(5.0),
            width: 400.0,
            height: 400.0,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("assets/images/correo.jpg"),
                fit: BoxFit.cover,
              )
            ),
          )
        ],
      ),
    );
  }
}