import 'package:flutter/material.dart';
import 'package:flutter_test_pj/global/custom_widgets/backgrounds/enter_screen_background.dart';
import 'package:flutter_test_pj/global/custom_widgets/backgrounds/swipe_logo.dart';
import 'package:flutter_test_pj/global/custom_widgets/buttons/custom_button.dart';
import 'package:flutter_test_pj/global/custom_widgets/buttons/custom_text_button.dart';
import 'package:flutter_test_pj/screens/auth_screen/sing_up_widget/custom_widget/sing_up_page2.dart';
import 'package:flutter_test_pj/screens/auth_screen/sing_up_widget/sing_up_screen.dart';

class SingUpPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EnterBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SwipeLogo(),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 100),
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Text(
                'Пройдите регистрацию для доступа к самой полной базе рынка квартир в Сочи!',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
            CustomButton(
              onTap: () {
                SingUpScreen.singUpPageController.animateToPage(
                  1,
                  duration: Duration(seconds: 1),
                  curve: Curves.easeInOut,
                );
              },
              text: 'Регистрация',
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 110, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
