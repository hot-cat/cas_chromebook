import 'package:flutter/material.dart';

var appTheme = ThemeData(
  useMaterial3: true, //Material 3
  brightness: Brightness.light,
  colorSchemeSeed: Colors.white,
);

class AppColors {
  static const Color white = Colors.white;
  static const Color mainPurple = Color(0xFF8242FF);
  static const Color darkPurple = Color(0xFF4E2799);
  static const Color lightDarkPurple = Color(0xFF6834CC);
  static const Color lightPurple = Color(0xFFBA96FF);
}
