import 'package:flutter/material.dart';
import 'package:flutter_test_pj/backgrounds/swipe_logo.dart';
import 'package:flutter_test_pj/buttons/custom_text_button.dart';
import 'package:flutter_test_pj/backgrounds/enter_screen_background.dart';

class EnterScreen3 extends StatelessWidget {
  final GestureTapCallback onTap;
  EnterScreen3({this.onTap});
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
          CustomTextButton(
            onTap: onTap,
            text: 'Войти',
          )
        ],
      ),
    ));
  }
}
