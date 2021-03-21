import 'package:flutter/material.dart';
import 'package:flutter_test_pj/global/style/gradients.dart';

class EnterBackground extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  EnterBackground({this.child, this.padding});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      alignment: Alignment.topCenter,
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        gradient: AppColors.backgroundGradient,
      ),
      child: child,
    );
  }
}
