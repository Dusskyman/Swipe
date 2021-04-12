import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_pj/global/custom_widgets/buttons/custom_text_button.dart';
import 'package:flutter_test_pj/screens/auth_screen/sing_in_widget/api/firestore_api.dart';
import 'package:flutter_test_pj/screens/auth_screen/sing_in_widget/custom_widget/sing_in_page_3.dart';
import 'package:flutter_test_pj/screens/auth_screen/sing_up_widget/api/firestore_adduser.dart';

import 'package:flutter_test_pj/screens/auth_screen/sing_up_widget/custom_widget/sing_up_page1.dart';
import 'package:flutter_test_pj/screens/auth_screen/sing_up_widget/custom_widget/sing_up_page2.dart';
import 'package:flutter_test_pj/screens/home_screen/home_screen.dart';

class SingUpScreen extends StatefulWidget {
  @override
  _SingUpScreenState createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  final PageController _singUpPageController = PageController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String _verificationId;

  AddUser addUser = AddUser();

  void pageNext() {
    _singUpPageController.nextPage(
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  void pageBack() {
    _singUpPageController.previousPage(
        duration: Duration(seconds: 1), curve: Curves.easeIn);
  }

  void verifyPhoneUser(String phone) async {
    if (await FireStoreApi.phoneIsRegistred(phone) == false) {
      await _auth.setLanguageCode('ru');
      await _auth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          showDialog(
              context: context,
              child: SimpleDialog(
                backgroundColor: Colors.black87,
                titlePadding: const EdgeInsets.all(10),
                title: Text(
                  'Неправильно указан номер!',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ));
          log(e.message);
        },
        codeSent: (String verificationId, int resendToken) {
          _verificationId = verificationId;
          pageNext();
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } else {
      await showDialog(
        context: context,
        child: AlertDialog(
          backgroundColor: Colors.black,
          title: Text(
            'Пользователь уже зарегистрирован',
            style: TextStyle(color: Colors.white),
          ),
          content: CustomText(
            text: 'Войти',
            color: Colors.blue,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SingUpScreen(),
              ),
            ),
          ),
        ),
      );
      log('Номер уже зарегистрирован');
    }
  }

  void _signIn(String smscode) async {
   final PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
      verificationId: _verificationId,
      smsCode: smscode,
    );
    try {
      await _auth.signInWithCredential(phoneAuthCredential).then(
        (value) async {
          if (value.user != null) {
            await addUser.addUser(SingUpPage2.text);
            await Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
                (route) => false);
          }
        },
      );
    } catch (e) {
      log('Неправильный верификационный код');
    }
  }

  Widget _buildSreen() {
    return PageView(
      controller: _singUpPageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        SingUpPage1(
          onTap: () => pageNext(),
        ),
        SingUpPage2(
          onTap: () {
            verifyPhoneUser(SingUpPage2.text['phone']);
          },
        ),
        SingInPage3(
          onCompleted: (String smscode) {
            _signIn(smscode);
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: _buildSreen(),
      onWillPop: () async {
        if (_singUpPageController.page.toInt() == 0) {
          return true;
        } else {
          pageBack();
          return false;
        }
      },
    );
  }
}
