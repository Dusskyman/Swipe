import 'package:flutter/material.dart';

import 'package:flutter_test_pj/global/custom_widgets/backgrounds/swipe_logo.dart';
import 'package:flutter_test_pj/global/custom_widgets/backgrounds/enter_screen_background.dart';
import 'package:flutter_test_pj/global/custom_widgets/buttons/custom_button.dart';
import 'package:flutter_test_pj/screens/auth_screen/sing_in_widget/main_enter_screen.dart';

class SingInPage3 extends StatelessWidget {
  final GestureTapCallback onTap;
  SingInPage3({this.onTap});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: EnterBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SwipeLogo(),
          Container(
            margin: const EdgeInsets.only(top: 50),
            
            child: Text(
              'Ту будет проверка кода, отправленная пользователю',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 50),
            width: 205,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              'Введите код который мы отправили на указаный вами номер телефона',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
          CustomButton(
            onTap: () {
              EnterPage.enterPageController.animateToPage(
                0,
                duration: Duration(seconds: 1),
                curve: Curves.easeInOut,
              );
            },
            text: 'Войти',
          )
        ],
      ),
    ));
  }
}
