import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:muze/modules/social/app/ui/widgets/like_icon.dart';
import 'package:muze/modules/social/app/ui/widgets/social_icon.dart';
import 'package:muze/modules/social/data/dtos/social_dto.dart';
import 'package:muze/utils/app_size.dart';
import 'package:muze/utils/constants/colors.dart';
import 'package:muze/utils/constants/constants.dart';
import 'package:muze/utils/time.dart';
import 'package:muze/widgets/follow_button.dart';
import 'package:muze/widgets/music_card.dart';

class SocialPost extends StatelessWidget {
  final PostDto post;
  final Function(bool playing) callbackPlaying;
  final Function(bool value)? callbackOnTapFollowButton;
  const SocialPost({super.key, required this.post, required this.callbackPlaying, this.callbackOnTapFollowButton});

  @override
  Widget build(BuildContext context) {
    int difference = 0;
    String differenceType = "";

    if (post.created_at != null) {
      Map differences = Time.getDifference(context, post.created_at!);
      difference = differences[DifferenceMapType.difference];
      differenceType = differences[DifferenceMapType.differenceType];
    }
    return Padding(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 20),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: post.user!.user_avatar != null
                      ? DecorationImage(
                          image: NetworkImage(post.user!.user_avatar!),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 30,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          post.user!.username ?? "",
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                height: 18.15 / 15,
                              ),
                        ),
                        if (post.is_suggestion!) ...{
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 20,
                          ),
                          FollowButton(
                            followButtonType: FollowButtonType.socialPost,
                            follow: post.user!.is_following!,
                            onTap: callbackOnTapFollowButton ?? (value) {},
                          ),
                        },
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 50,
                        ),
                        const Expanded(
                          child: Divider(),
                        ),
                      ],
                    ),
                    Text(
                      difference == 0
                          ? "Maintenant"
                          : "Il y a $difference ${difference > 1 ? differenceType != "mois" ? "${differenceType}s" : differenceType : differenceType}",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 10,
                            color: AppColors.greyText,
                          ),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 40,
          ),
          Padding(
            padding: EdgeInsets.only(right: MediaQuery.of(context).size.width / 20),
            child: Column(
              children: [
                AppSize.getHeight(context) > 700
                    ? MusicCard(
                        height: MusicCardHeight.large,
                        post: post,
                        callbackPlaying: callbackPlaying,
                      )
                    : MusicCard(
                        height: MusicCardHeight.medium,
                        post: post,
                        callbackPlaying: callbackPlaying,
                      ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    LikeIcon(
                      amount: post.total_likes ?? 0,
                      liked: post.liked_by_user ?? false,
                      postId: "${post.id}",
                    ),
                    Visibility(
                      visible: true,
                      child: SocialIcon(
                        onTap: () {
                          log("tap on comment");
                        },
                        iconPath: Constants.commentIcon,
                      ),
                    ),
                    Visibility(
                      visible: true,
                      child: SocialIcon(
                        onTap: () {
                          log("tap on category");
                        },
                        iconPath: Constants.categoryIcon,
                      ),
                    ),
                    Visibility(
                      visible: true,
                      child: SocialIcon(
                        onTap: () {
                          log("tap on share");
                        },
                        iconPath: Constants.shareSocialIcon,
                      ),
                    ),
                    Visibility(
                      visible: true,
                      child: SocialIcon(
                        onTap: () {
                          log("tap on settings");
                        },
                        iconPath: Constants.settingsIcon,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
