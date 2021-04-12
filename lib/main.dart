import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test_pj/screens/auth_screen/sing_in_widget/main_enter_screen.dart';
import 'package:flutter_test_pj/screens/home_screen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await FirebaseAuth.instance.signOut();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark),
    );
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Swipe',
        home: FutureBuilder(
          builder: (context, snapshot) {
            if (FirebaseAuth.instance.currentUser != null) {
              // return ProfilePage();
              return HomeScreen();
            } else {
              return EnterScreen();
            }
          },
        ));
  }
}
