import 'package:flutter/material.dart';

import 'package:flutter_test_pj/global/custom_widgets/backgrounds/swipe_logo.dart';
import 'package:flutter_test_pj/global/custom_widgets/backgrounds/enter_screen_background.dart';
import 'package:flutter_test_pj/global/custom_widgets/buttons/custom_button.dart';
import 'package:flutter_test_pj/screens/auth_screen/sing_in_widget/custom_widget/otp_custom_fields.dart';

class SingInPage3 extends StatelessWidget {
  static String phone;
  final GestureTapCallback onTap;
  final ValueChanged<String> onCompleted;

  SingInPage3({@required this.onCompleted, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EnterBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SwipeLogo(),
            OtpCustomFields(
              fieldWidth: 30,
              width: 250,
              onCompleted: (smscode) => onCompleted(smscode),
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
              onTap: () => onTap(),
              text: 'Войти',
            )
          ],
        ),
      ),
    );
  }
}
