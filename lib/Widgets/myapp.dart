import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import './homepage.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.yellow);
    return MaterialApp(
      title: 'ESL - Elektrik Shopping List',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: MyHomePage(
        title: 'Ez Shopping List'),
    );
  }
}
