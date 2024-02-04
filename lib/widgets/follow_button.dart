import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:muze/l10n/l10n.dart';
import 'package:muze/utils/app_size.dart';
import 'package:muze/utils/constants/colors.dart';

enum FollowButtonType {
  classic,
  socialPost,
}

class FollowButton extends StatefulWidget {
  final bool follow;
  final Function(bool value) onTap;
  final FollowButtonType? followButtonType;
  const FollowButton({super.key, required this.follow, required this.onTap, this.followButtonType});

  @override
  State<FollowButton> createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  bool follow = false;

  @override
  void initState() {
    follow = widget.follow;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return Bounceable(
      onTap: () {
        widget.onTap.call(!follow);
        setState(() {
          follow = !follow;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(48),
          color: follow ? AppColors.greyText : AppColors.primary[800],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: widget.followButtonType != null && widget.followButtonType == FollowButtonType.socialPost ? AppSize.getWidth(context) / 25 : AppSize.getWidth(context) / 22,
              vertical: widget.followButtonType != null && widget.followButtonType == FollowButtonType.socialPost ? AppSize.getHeight(context) / 150 : AppSize.getHeight(context) / 95),
          child: Text(follow ? localizations.following_text : localizations.follow_text,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: widget.followButtonType != null && widget.followButtonType == FollowButtonType.socialPost ? 12 : 13)),
        ),
      ),
    );
  }
}
