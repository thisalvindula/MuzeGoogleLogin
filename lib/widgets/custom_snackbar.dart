import 'package:flutter/material.dart';
import 'package:muze/utils/constants/colors.dart';

class CustomSnackBar {
  CustomSnackBar(BuildContext context, {required String text}) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        backgroundColor: AppColors.primary,
      ),
    );
  }
}
