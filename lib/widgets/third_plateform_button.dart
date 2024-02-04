import 'package:flutter/material.dart';
import 'package:muze/utils/constants/colors.dart';
import 'package:muze/utils/constants/constants.dart';

enum ThirdPlateformType {
  apple,
  google,
  spotify,
}

class ThirdPlateformButton extends StatelessWidget {
  final ThirdPlateformType type;
  final Function() onTap;
  const ThirdPlateformButton({super.key, required this.type, required this.onTap});

  Widget getPlateformIcon(BuildContext context, ThirdPlateformType type) {
    switch (type) {
      case ThirdPlateformType.apple:
        return Icon(Icons.apple, size: MediaQuery.of(context).size.width / 15);
      case ThirdPlateformType.google:
        return Image.asset(Constants.googleLogo);
      case ThirdPlateformType.spotify:
        return Image.asset(Constants.spotifyLogo);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: (MediaQuery.of(context).size.width / 8.2).round().toDouble(),
        height: (MediaQuery.of(context).size.width / 8.2).round().toDouble(),
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width / 25),
        ),
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width / 36),
          child: Opacity(
            opacity: 0.3,
            child: getPlateformIcon(context, type),
          ),
        ),
      ),
    );
  }
}
