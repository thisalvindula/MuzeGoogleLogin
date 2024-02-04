import 'package:flutter/material.dart';
import 'package:muze/utils/constants/colors.dart';

enum ResetPasswordButtonType {
  purple,
  grey,
}

class ResetPasswordButton extends StatelessWidget {
  final String title;
  final ResetPasswordButtonType type;
  final Function() onTap;
  const ResetPasswordButton({super.key, required this.title, required this.type, required this.onTap});

  @override
  Widget build(BuildContext context) {
    Color shadowColor;
    Color backgroundColor;
    switch (type) {
      case ResetPasswordButtonType.purple:
        shadowColor = AppColors.purpleShadow;
        backgroundColor = AppColors.primary;
        break;
      case ResetPasswordButtonType.grey:
        shadowColor = AppColors.lightGreyShadow;
        backgroundColor = AppColors.lightGrey;
        break;
    }
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height / 13,
        width: MediaQuery.of(context).size.width / 2.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: shadowColor),
            BoxShadow(
              color: backgroundColor,
              blurRadius: 1,
              spreadRadius: 0,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600, fontSize: 16, height: 26 / 16),
          ),
        ),
      ),
    );
  }
}
