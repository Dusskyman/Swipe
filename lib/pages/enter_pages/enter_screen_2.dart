import 'package:flutter/material.dart';
import 'package:flutter_test_pj/backgrounds/swipe_logo.dart';
import 'package:flutter_test_pj/buttons/custom_text_button.dart';
import 'package:flutter_test_pj/backgrounds/enter_screen_background.dart';

class EnterScreen2 extends StatelessWidget {
  final GestureTapCallback onTap;
  EnterScreen2({this.onTap});
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
            child: Text(
              'Тут будет ввод и верификация номера',
              style: TextStyle(color: Colors.white),
            ),
          ),
          CustomTextButton(
            onTap: onTap,
            text: 'Далее',
          )
        ],
      ),
    ));
  }
}
