import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muze/utils/constants/colors.dart';

class SocialIcon extends StatelessWidget {
  final Function() onTap;
  final int? amount;
  final String iconPath;
  const SocialIcon({super.key, required this.onTap, this.amount, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(iconPath, width: 18),
          amount != null
              ? Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 50,
                    ),
                    Text(
                      "$amount",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 13, fontWeight: FontWeight.w400, color: AppColors.lightGreyWhiteText),
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
