import 'package:flutter/material.dart';

import 'package:flutter_test_pj/global/custom_widgets/TextFields/custom_text_field.dart';
import 'package:flutter_test_pj/global/custom_widgets/backgrounds/enter_screen_background.dart';
import 'package:flutter_test_pj/global/custom_widgets/backgrounds/swipe_logo.dart';
import 'package:flutter_test_pj/global/custom_widgets/buttons/custom_button.dart';

class SingUpPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EnterBackground(
        padding: const EdgeInsets.only(top: 200),
        child: Column(
          children: [
            SwipeLogo(),
            CustomTextField(
              keyboardType: TextInputType.name,
              margin: EdgeInsets.fromLTRB(0, 50, 0, 5),
              text: 'Имя',
            ),
            CustomTextField(
              keyboardType: TextInputType.name,
              margin: EdgeInsets.symmetric(vertical: 5),
              text: 'Фамилия',
            ),
            CustomTextField(
              margin: EdgeInsets.symmetric(vertical: 5),
              text: 'Телефон',
            ),
            CustomTextField(
              keyboardType: TextInputType.emailAddress,
              margin: EdgeInsets.fromLTRB(0, 5, 0, 50),
              text: 'Электронная почта',
            ),
            CustomButton(
              text: 'Зарегистрироваться',
            )
          ],
        ),
      ),
    );
  }
}
