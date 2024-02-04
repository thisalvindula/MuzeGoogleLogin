import 'package:flutter/material.dart';

class AppColors {
  static const int purple = 0xFF7339E5;

  static const MaterialColor primary = MaterialColor(purple, <int, Color>{
    500: Color(purple),
    800: Color(0xFF804CEF),
  });

  // Basic
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color red = Colors.red;

  // Widget color
  static const Color backgroundBlack = Color(0xFF080808);
  static const Color grey = Color(0xFF1A1A1B);
  static const Color lightGrey = Color(0xFF262629);
  static const Color spotifyGreen = Color(0xFF1DB954);
  static const Color spotifyBlack = Color(0xFF191414);

  // Text color
  static const Color greyText = Color(0xFF575758);
  static const Color lightGreyWhiteText = Color(0xFFD9D9D9);

  // Shadow color
  static const Color lightGreyShadow = Color(0xFF303033);
  static const Color blackShadow = Color(0x7F000000);
  static const Color purpleShadow = Color(0xFF804CEF);
}
