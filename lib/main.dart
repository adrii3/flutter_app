import 'package:flutter/material.dart';

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

  List<String> posts = [
    "Stiben",
    "Paquirrin",
    "Tarzan"
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Puig Incidències',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Puig Incidències'),
        ),
        body: Column(

      ),
    );
  }
}


