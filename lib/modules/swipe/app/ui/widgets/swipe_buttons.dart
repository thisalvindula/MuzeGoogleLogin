import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muze/utils/app_size.dart';
import 'package:muze/utils/constants/constants.dart';

class SwipeButtons extends StatelessWidget {
  final Function() onDislike;
  final Function() onShare;
  final Function() onLike;
  const SwipeButtons({super.key, required this.onDislike, required this.onShare, required this.onLike});

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(0, -AppSize.getHeight(context) / 50, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Bounceable(
            onTap: onDislike,
            child: SvgPicture.asset(Constants.dislikeIcon),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 20,
          ),
          Bounceable(
            onTap: onShare,
            child: SvgPicture.asset(Constants.shareIcon),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 20,
          ),
          Bounceable(
            onTap: onLike,
            child: SvgPicture.asset(Constants.likeIcon),
          ),
        ],
      ),
    );
  }
}
