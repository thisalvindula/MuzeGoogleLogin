import 'package:flutter/material.dart';
import 'package:muze/theme/text_theme.dart';
import 'package:muze/utils/constants/colors.dart';

class AppTheme {
  final BuildContext context;
  AppTheme(this.context);

  ThemeData appTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      textTheme: AppTextTheme(context).textTheme(),
      primaryTextTheme: AppTextTheme(context).textTheme(),
      scaffoldBackgroundColor: AppColors.backgroundBlack,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }
}
