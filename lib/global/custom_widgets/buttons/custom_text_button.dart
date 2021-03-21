import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final Color color;
  final String text;
  final GestureTapCallback onTap;
  CustomText({
    this.onTap,
    this.color,
    this.text,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
