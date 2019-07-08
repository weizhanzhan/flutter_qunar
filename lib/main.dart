import 'package:flutter/material.dart';
import 'package:flutter_qunar/Widget/tab_navigator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'qunar',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: TabNavigator(),
    );
  }
}