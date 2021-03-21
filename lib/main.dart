import 'package:flutter/material.dart';
import 'package:flutter_test_pj/screens/auth_screen/sing_in_widget/main_enter_screen.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swipe',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: EnterPage(),
    );
  }
}
