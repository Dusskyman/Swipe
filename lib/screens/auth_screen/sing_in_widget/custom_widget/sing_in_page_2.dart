import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_test_pj/global/custom_widgets/TextFields/custom_text_field.dart';
import 'package:flutter_test_pj/global/custom_widgets/backgrounds/swipe_logo.dart';
import 'package:flutter_test_pj/global/custom_widgets/backgrounds/enter_screen_background.dart';
import 'package:flutter_test_pj/global/custom_widgets/buttons/custom_button.dart';

class SingInPage2 extends StatelessWidget {
  final TextEditingController textcontroller;
  final GestureTapCallback onTap;
  final ValueChanged<String> onComleted;
  static String phone;
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();

  SingInPage2({this.onTap, this.textcontroller, this.onComleted});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EnterBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SwipeLogo(),
            CustomTextField(
              onChanged: (value) => phone = value,
              formatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[+0-9]'))
              ],
              textcontroller: textcontroller,
              margin: const EdgeInsets.fromLTRB(0, 72, 0, 25),
              text: 'Телефон',
            ),
            CustomButton(
              onTap: () {
                onComleted(phone);
                FocusScope.of(context).unfocus();
              },
              text: 'Далее',
            )
          ],
        ),
      ),
    );
  }
}
