import 'package:flutter/material.dart';
import 'package:flutter_test_pj/backgrounds/swipe_logo.dart';
import 'package:flutter_test_pj/backgrounds/enter_screen_background.dart';
import 'package:flutter_test_pj/buttons/custom_text_button.dart';

class EnterScreen1 extends StatelessWidget {
  final GestureTapCallback onTap;
  EnterScreen1({this.onTap});
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
          CustomTextButton(
            onTap: onTap,
            text: 'Войти',
          )
        ],
      ),
    ));
  }
}
