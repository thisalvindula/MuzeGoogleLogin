import 'package:flutter/material.dart';
import 'package:muze/utils/app_size.dart';
import 'package:muze/utils/constants/constants.dart';

class MuzeLogo extends StatelessWidget {
  final double angle;
  const MuzeLogo({super.key, required this.angle});

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..translate(0.0, 0.0)
        ..rotateZ(angle),
      alignment: Alignment.center,
      child: Image.asset(
        Constants.muzeLogo,
        width: AppSize.getWidth(context) / 7,
      ),
    );
  }
}
