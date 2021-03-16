import 'package:flutter/material.dart';

class EnterBackground extends StatelessWidget {
  final Widget child;
  EnterBackground({this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF0B3138),
            Color(0xFF0A4A46),
          ],
        ),
      ),
      child: child,
    );
  }
}
