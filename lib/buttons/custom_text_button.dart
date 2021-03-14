import 'package:flutter/material.dart';
import 'package:flutter_test_pj/colors/gradients.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final Color color;
  final GestureTapCallback onTap;
  final double width;
  final double height;

  CustomTextButton({
    this.text,
    this.color,
    this.height,
    this.width,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? 253,
        height: height ?? 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: Gradients.buttongradient,
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
