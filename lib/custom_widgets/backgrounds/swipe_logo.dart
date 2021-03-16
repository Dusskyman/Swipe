import 'package:flutter/material.dart';

class SwipeLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/swipe.png',
          height: 40,
          fit: BoxFit.contain,
        ),
        Container(
          margin: const EdgeInsets.only(left: 15),
          child: Text(
            'свайп',
            style: TextStyle(
              fontSize: 42,
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ],
    );
  }
}
