import 'package:flutter/material.dart';

import 'package:flutter_test_pj/custom_widgets/backgrounds/swipe_logo.dart';
import 'package:flutter_test_pj/custom_widgets/buttons/custom_text_button.dart';
import 'package:flutter_test_pj/custom_widgets/backgrounds/enter_screen_background.dart';

class EnterScreen2 extends StatefulWidget {
  final GestureTapCallback onTap;
  EnterScreen2({
    this.onTap,
  });

  @override
  _EnterScreen2State createState() => _EnterScreen2State();
}

class _EnterScreen2State extends State<EnterScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: EnterBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SwipeLogo(),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 61),
            height: 44,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(colors: [
                  Color(0x2027ae63),
                  Color(0x4027ae93),
                ])),
            child: TextField(
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
              decoration: InputDecoration(
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.white38,
                ),
                hintText: 'Телефон',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 3,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white10,
                  ),
                ),
              ),
            ),
          ),
          CustomTextButton(
            onTap: widget.onTap,
            text: 'Далее',
          )
        ],
      ),
    ));
  }
}
