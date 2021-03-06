import 'package:flutter/material.dart';

import 'package:flutter_test_pj/global/custom_widgets/backgrounds/swipe_logo.dart';
import 'package:flutter_test_pj/global/custom_widgets/backgrounds/enter_screen_background.dart';
import 'package:flutter_test_pj/global/custom_widgets/buttons/custom_button.dart';
import 'package:flutter_test_pj/global/custom_widgets/buttons/custom_text_button.dart';
import 'package:flutter_test_pj/screens/auth_screen/sing_up_widget/sing_up_screen.dart';

class SingInPage1 extends StatelessWidget {
  final GestureTapCallback onTap;

  SingInPage1({this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EnterBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SwipeLogo(),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 50),
              width: 205,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                'Открой доступ к самой полной базе рынка квартир в Сочи!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
            CustomButton(
              onTap: () {
                onTap();
              },
              text: 'Войти',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Впервые у нас?',
                    style: TextStyle(
                      color: Colors.white38,
                    ),
                  ),
                  CustomText(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SingUpScreen()),
                      );
                    },
                    text: 'Регистрация',
                    color: Colors.white,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
