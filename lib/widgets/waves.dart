import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:muze/utils/constants/constants.dart';

class Waves extends StatelessWidget {
  final bool reverse;
  const Waves({super.key, required this.reverse});

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationZ(reverse ? 3.14159 : 0),
      child: Opacity(
        opacity: 0.3,
        child: Lottie.asset(
          Constants.wavesAnimation,
          height: MediaQuery.of(context).size.height / (reverse ? 15 : 10),
          fit: BoxFit.fitWidth,
          width: MediaQuery.of(context).size.width,
          frameRate: FrameRate(15),
        ),
      ),
    );
  }
}
