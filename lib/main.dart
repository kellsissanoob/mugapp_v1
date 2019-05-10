import 'package:flutter/material.dart';
import 'package:mugapp_v1/Pages/Setup/signUp.dart';
import 'package:mugapp_v1/Pages/Setup/welcome.dart';
import 'package:mugapp_v1/Pages/home.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MugApp',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: WelcomePage(),
      routes: <String, WidgetBuilder>
      {
        '/landingpage': (BuildContext context) => new MyApp(),
        '/signup': (BuildContext context) => new SignUpPage(),
        '/homepage': (BuildContext context) => new Home()
      },
    );
  }
}