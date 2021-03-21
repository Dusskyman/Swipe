import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static final LinearGradient buttongradient = LinearGradient(
    colors: [
      Color(0xff56C385),
      Color(0xff41bfb5),
    ],
  );
  static final LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF0B3138),
      Color(0xFF0A4A46),
    ],
  );
}
