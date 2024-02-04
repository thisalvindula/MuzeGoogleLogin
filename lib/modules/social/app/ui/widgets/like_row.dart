import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:muze/core/locator/locator.dart';
import 'package:muze/modules/social/app/cubits/social_cubit.dart';
import 'package:muze/modules/social/data/dtos/likes_dto.dart';
import 'package:muze/utils/constants/colors.dart';
import 'package:muze/utils/time.dart';
import 'package:muze/widgets/follow_button.dart';

class LikeRow extends StatelessWidget {
  final LikeDto like;
  const LikeRow({super.key, required this.like});

  @override
  Widget build(BuildContext context) {
    int difference = 0;
    String differenceType = "";

    if (like.created_at != null) {
      Map differences = Time.getDifference(context, like.created_at!);
      difference = differences[DifferenceMapType.difference];
      differenceType = differences[DifferenceMapType.differenceType];
    }
    log("${MediaQuery.of(context).size.width / 9}");
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 9,
                height: MediaQuery.of(context).size.height / 20,
                decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                  shape: BoxShape.circle,
                ),
                child: like.user!.user_avatar != null ? Image.network(like.user!.user_avatar!) : Container(),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    like.user!.username ?? "",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          height: 18.15 / 15,
                        ),
                  ),
                  Text(
                    difference == 0
                        ? "Maintenant"
                        : "Il y a $difference ${difference > 1 ? differenceType != "mois" ? "${differenceType}s" : differenceType : differenceType}",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 10, color: AppColors.greyText, height: MediaQuery.of(context).size.height / 400),
                  )
                ],
              ),
            ],
          ),
          FollowButton(
            follow: like.user!.is_following!,
            onTap: (bool value) {
              locator<SocialCubit>().followUser(userId: "${like.user!.id!}", follow: value);
            },
          ),
        ],
      ),
    );
  }
}
