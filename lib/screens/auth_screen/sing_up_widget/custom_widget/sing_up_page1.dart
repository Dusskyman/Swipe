import 'package:flutter/material.dart';

import 'package:flutter_test_pj/global/custom_widgets/backgrounds/enter_screen_background.dart';
import 'package:flutter_test_pj/global/custom_widgets/backgrounds/swipe_logo.dart';
import 'package:flutter_test_pj/global/custom_widgets/buttons/custom_button.dart';
import 'package:flutter_test_pj/global/custom_widgets/buttons/custom_text_button.dart';

class SingUpPage1 extends StatelessWidget {
  final VoidCallback onTap;
  SingUpPage1({this.onTap});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EnterBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SwipeLogo(),
            Container(
              key: UniqueKey(),
              margin: const EdgeInsets.symmetric(horizontal: 100),
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Text(
                'Пройдите регистрацию для доступа к самой полной базе рынка квартир в Сочи!',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
            CustomButton(
              onTap: () => onTap(),
              text: 'Регистрация',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Уже есть аккаунт?',
                    style: TextStyle(
                      color: Colors.white38,
                    ),
                  ),
                  CustomText(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    text: 'Войти',
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
