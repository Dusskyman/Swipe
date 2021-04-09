import 'package:flutter/material.dart';

class SwipeLogo extends StatelessWidget {
  final double height;
  final double width;
  SwipeLogo({
    this.height,
    this.width,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/swipe.png',
          height: height ?? 40,
          width: width ?? 80,
          fit: BoxFit.contain,
        ),
        Container(
          margin: const EdgeInsets.only(left: 15),
          child: Text(
            'свайп',
            style: TextStyle(
              fontSize: height ?? 42,
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ],
    );
  }
}
