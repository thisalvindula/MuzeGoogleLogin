import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muze/utils/constants/colors.dart';

class AppTextTheme {
  final BuildContext context;
  AppTextTheme(this.context);

  TextTheme textTheme() {
    return TextTheme(
      bodyMedium: GoogleFonts.inter(
        fontSize: (MediaQuery.of(context).size.width / 23).round().toDouble(),
        color: AppColors.white,
        fontWeight: FontWeight.w500,
        height: 22 / (MediaQuery.of(context).size.width / 23).round().toDouble(),
      ),
      displayMedium: GoogleFonts.montserrat(
        fontSize: 14,
        color: AppColors.white,
        fontWeight: FontWeight.w500,
        height: 22 / 14,
      ),
      labelMedium: const TextStyle(
        fontFamily: "SF Pro Display",
        fontSize: 14,
        color: AppColors.white,
        fontWeight: FontWeight.w500,
        height: 22 / 14,
      ),
    );
  }
}

class ScaleSize {
  static textScaleFactor(BuildContext context, {double maxTextScaleFactor = 2}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1400) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor)).toDouble();
  }
}
