import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_test_pj/global/custom_widgets/TextFields/custom_text_field.dart';
import 'package:flutter_test_pj/global/custom_widgets/backgrounds/enter_screen_background.dart';
import 'package:flutter_test_pj/global/custom_widgets/backgrounds/swipe_logo.dart';
import 'package:flutter_test_pj/global/custom_widgets/buttons/custom_button.dart';

class SingUpPage2 extends StatelessWidget {
  final GestureTapCallback onTap;

  static final Map<String, String> text = {};
  SingUpPage2({this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EnterBackground(
        padding: const EdgeInsets.only(top: 120),
        child: Column(
          children: [
            SwipeLogo(),
            CustomTextField(
              onChanged: (value) {
                text['name'] = value;
              },
              keyboardType: TextInputType.name,
              margin: EdgeInsets.fromLTRB(0, 50, 0, 5),
              text: 'Имя',
            ),
            CustomTextField(
              onChanged: (value) {
                text['surname'] = value;
              },
              keyboardType: TextInputType.name,
              margin: EdgeInsets.symmetric(vertical: 5),
              text: 'Фамилия',
            ),
            CustomTextField(
              onChanged: (value) {
                text['phone'] = value;
              },
              margin: EdgeInsets.symmetric(vertical: 5),
              text: 'Телефон',
            ),
            CustomTextField(
              onChanged: (value) {
                text['email'] = value;
              },
              keyboardType: TextInputType.emailAddress,
              margin: EdgeInsets.fromLTRB(0, 5, 0, 50),
              text: 'Электронная почта',
            ),
            CustomButton(text: 'Зарегистрироваться', onTap: () => onTap())
          ],
        ),
      ),
    );
  }
}
