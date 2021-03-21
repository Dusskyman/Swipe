import 'package:flutter/material.dart';
import 'package:flutter_test_pj/screens/auth_screen/sing_up_widget/custom_widget/sing_up_page1.dart';
import 'package:flutter_test_pj/screens/auth_screen/sing_up_widget/custom_widget/sing_up_page2.dart';

class SingUpScreen extends StatelessWidget {
  static final PageController singUpPageController = PageController();
  void pageBack() {
    singUpPageController.previousPage(
        duration: Duration(seconds: 1), curve: Curves.easeIn);
  }

  Widget _buildSreen() {
    return PageView(
      controller: singUpPageController,
      // physics: NeverScrollableScrollPhysics(),
      children: [
        SingUpPage1(),
        SingUpPage2(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: _buildSreen(),
      onWillPop: () async {
        if (singUpPageController.page.toInt() == 0) {
          return true;
        } else {
          pageBack();
          return false;
        }
      },
    );
  }
}
