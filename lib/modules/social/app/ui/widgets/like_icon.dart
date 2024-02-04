import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muze/core/locator/locator.dart';
import 'package:muze/modules/social/app/cubits/social_cubit.dart';
import 'package:muze/modules/social/app/ui/widgets/likes_bottom_dialog.dart';
import 'package:muze/utils/app_size.dart';
import 'package:muze/utils/constants/colors.dart';
import 'package:muze/utils/constants/constants.dart';

class LikeIcon extends StatefulWidget {
  final String postId;
  final int amount;
  final bool liked;
  const LikeIcon({super.key, required this.amount, required this.liked, required this.postId});

  @override
  State<LikeIcon> createState() => _LikeIconState();
}

class _LikeIconState extends State<LikeIcon> {
  int finalAmount = 0;
  bool liked = false;

  @override
  void initState() {
    finalAmount = widget.amount;
    liked = widget.liked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            locator<SocialCubit>().likePost(postId: widget.postId, liked: !liked);
            setState(() {
              liked ? {finalAmount--, liked = false} : {finalAmount++, liked = true};
            });
          },
          child: liked ? Image.asset(Constants.heartFillIcon, width: 18) : SvgPicture.asset(Constants.heartIcon, width: 18),
        ),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            log("like");
            locator<SocialCubit>().clearLikes();
            locator<SocialCubit>().getLikes(page: "1", postId: widget.postId);
            if (context.mounted) {
              LikesBottomDialog().show(context);
            }
          },
          child: Row(
            children: [
              SizedBox(
                width: AppSize.getWidth(context) / 50,
              ),
              Container(
                color: Colors.transparent,
                width: AppSize.getWidth(context) / 20,
                height: AppSize.getHeight(context) / 40,
                child: Center(
                  child: Text(
                    "$finalAmount",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 13, fontWeight: FontWeight.w400, color: AppColors.lightGreyWhiteText),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
