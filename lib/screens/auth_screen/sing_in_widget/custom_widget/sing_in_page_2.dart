import 'package:flutter/material.dart';

import 'package:flutter_test_pj/global/custom_widgets/TextFields/custom_text_field.dart';
import 'package:flutter_test_pj/global/custom_widgets/backgrounds/swipe_logo.dart';
import 'package:flutter_test_pj/global/custom_widgets/backgrounds/enter_screen_background.dart';
import 'package:flutter_test_pj/global/custom_widgets/buttons/custom_button.dart';
import 'package:flutter_test_pj/screens/auth_screen/sing_in_widget/main_enter_screen.dart';

class SingInPage2 extends StatefulWidget {
  @override
  _SingInPage2State createState() => _SingInPage2State();
}

class _SingInPage2State extends State<SingInPage2> {
  final TextEditingController textcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EnterBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SwipeLogo(),
            CustomTextField(
              textcontroller: textcontroller,
              margin: const EdgeInsets.fromLTRB(0, 72, 0, 25),
              text: 'Телефон',
            ),
            CustomButton(
              onTap: () {
                textcontroller.clear();
                EnterPage.enterPageController.animateToPage(
                  2,
                  duration: Duration(seconds: 1),
                  curve: Curves.easeInOut,
                );
              },
              text: 'Далее',
            )
          ],
        ),
      ),
    );
  }
}
