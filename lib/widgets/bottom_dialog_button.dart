import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:muze/utils/constants/colors.dart';

enum BottomDialogButtonType {
  right,
  left,
}

class BottomDialogButton extends StatelessWidget {
  final BottomDialogButtonType type;
  final String title;
  final Function() onTap;
  const BottomDialogButton({super.key, required this.type, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 18,
        decoration: BoxDecoration(
          color: type == BottomDialogButtonType.right ? AppColors.primary : AppColors.lightGrey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(title),
        ),
      ),
    );
  }
}
