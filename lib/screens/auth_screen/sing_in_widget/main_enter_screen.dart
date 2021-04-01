import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test_pj/screens/auth_screen/sing_in_widget/api/firestore_api.dart';

import 'package:flutter_test_pj/screens/auth_screen/sing_in_widget/custom_widget/sing_in_page_1.dart';
import 'package:flutter_test_pj/screens/auth_screen/sing_in_widget/custom_widget/sing_in_page_2.dart';
import 'package:flutter_test_pj/screens/auth_screen/sing_in_widget/custom_widget/sing_in_page_3.dart';
import 'package:flutter_test_pj/screens/home_screen/home_screen.dart';

class EnterScreen extends StatefulWidget {

  @override
  _EnterScreenState createState() => _EnterScreenState();
}

class _EnterScreenState extends State<EnterScreen> {
  final PageController enterPageController = PageController(keepPage: false);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _verificationId;

  void pageNext() {
    enterPageController.nextPage(
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  void pageBack() {
    enterPageController.previousPage(
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  void verifyPhoneUser(String phone) async {
    setState(() {});
    if (await FireStoreApi.phoneIsRegistred(phone)) {
      await _auth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          setState(() {});
          log('Неправильно указан номер!');
        },
        codeSent: (String verificationId, int resendToken) {
          _verificationId = verificationId;
          pageNext();
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } else {
      log('Пользователь еще не зарегистрирован!');
    }
  }

  void _signIn(String smscode) async {
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
      verificationId: _verificationId,
      smsCode: smscode,
    );
    try {
      await _auth.signInWithCredential(phoneAuthCredential);
    } catch (e) {
      log('Неправильный верификационный код');
    }
  }

  Widget buildSreen() {
    return PageView(
      controller: enterPageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        SingInPage1(onTap: () {
          pageNext();
        }),
        SingInPage2(
          onComleted: (String phone) {
            verifyPhoneUser(phone);
          },
        ),
        SingInPage3(
          onCompleted: (String smscode) {
            _signIn(smscode);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
                (route) => false);
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: buildSreen(),
      onWillPop: () async {
        if (enterPageController.page.toInt() == 0) {
          return true;
        } else {
          pageBack();
          return false;
        }
      },
    );
  }
}
