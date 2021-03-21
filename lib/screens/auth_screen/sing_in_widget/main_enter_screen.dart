import 'package:flutter/material.dart';

import 'package:flutter_test_pj/screens/auth_screen/sing_in_widget/custom_widget/sing_in_page_1.dart';
import 'package:flutter_test_pj/screens/auth_screen/sing_in_widget/custom_widget/sing_in_page_2.dart';
import 'package:flutter_test_pj/screens/auth_screen/sing_in_widget/custom_widget/sing_in_page_3.dart';

class EnterPage extends StatelessWidget {
  static final PageController enterPageController = PageController();
  void pageBack() {
    enterPageController.previousPage(
      duration: Duration(seconds: 1),
      curve: Curves.easeIn,
    );
  }

  Widget buildSreen() {
    return PageView(
      controller: enterPageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        SingInPage1(),
        SingInPage2(),
        SingInPage3(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: buildSreen(),
      onWillPop: () async {
        if (enterPageController.page.toInt() == 0) {
          return true;
        } else {
          pageBack();
          return false;
        }
      },
    );
  }
}
