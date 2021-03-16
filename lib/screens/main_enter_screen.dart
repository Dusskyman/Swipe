import 'package:flutter/material.dart';

import 'package:flutter_test_pj/screens/enter_pages/enter_screen_1.dart';
import 'package:flutter_test_pj/screens/enter_pages/enter_screen_2.dart';
import 'package:flutter_test_pj/screens/enter_pages/enter_screen_3.dart';

class EnterPage extends StatelessWidget {
  final PageController controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      physics: NeverScrollableScrollPhysics(),
      children: [
        EnterScreen1(
          onTap: () {
            controller.animateToPage(
              1,
              duration: Duration(seconds: 1),
              curve: Curves.easeInOut,
            );
          },
        ),
        EnterScreen2(
          onTap: () {
            controller.animateToPage(
              2,
              duration: Duration(seconds: 1),
              curve: Curves.easeInOut,
            );
          },
        ),
        EnterScreen3(
          onTap: () {
            controller.animateToPage(
              0,
              duration: Duration(seconds: 1),
              curve: Curves.easeInOut,
            );
          },
        )
      ],
    );
  }
}
