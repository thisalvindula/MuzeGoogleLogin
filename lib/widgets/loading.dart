import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:muze/utils/constants/constants.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      Constants.loadingAnimation,
      fit: BoxFit.contain,
      height: MediaQuery.of(context).size.height / 13,
      frameRate: FrameRate(60),
    );
  }
}
