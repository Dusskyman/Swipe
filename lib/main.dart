import 'package:flutter/material.dart';
import 'package:flutter_test_pj/screens/main_enter_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: EnterPage(),
    );
  }
}
