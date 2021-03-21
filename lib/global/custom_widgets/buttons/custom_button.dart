import 'package:flutter/material.dart';

import 'package:flutter_test_pj/global/style/gradients.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final GestureTapCallback onTap;
  final double width;
  final double height;

  CustomButton({
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
            gradient: AppColors.buttongradient,
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          text,
          style: TextStyle(
            color: color ?? Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
