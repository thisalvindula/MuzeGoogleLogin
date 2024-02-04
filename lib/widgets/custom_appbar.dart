import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gif_view/gif_view.dart';
import 'package:muze/core/router/navigation_helpers.dart';
import 'package:muze/utils/app_size.dart';
import 'package:muze/utils/constants/constants.dart';

enum CustomAppBarType {
  nothing,
  newsAndChat,
  settings,
  spotifyAndSettings,
  newsChatAndSettings,
}

class CustomAppBar extends StatelessWidget {
  final Function()? onTapNews;
  final Function()? onTapChat;
  final Function()? onTapSettings;
  final Function()? onTapSpotify;
  final CustomAppBarType customAppBarType;
  final bool? showBackButton;
  final bool? showMuzeLogo;
  final String? title;
  const CustomAppBar({super.key, this.onTapNews, required this.customAppBarType, this.showBackButton, this.onTapChat, this.onTapSettings, this.onTapSpotify, this.showMuzeLogo, this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: AppSize.getWidth(context) / 17.8, right: AppSize.getWidth(context) / 17.8, top: AppSize.getHeight(context) / 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              showBackButton != null && showBackButton!
                  ? Row(
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            context.navigator.pop();
                          },
                          child: Container(
                            color: Colors.transparent,
                            padding: EdgeInsets.symmetric(horizontal: AppSize.getWidth(context) / 80, vertical: AppSize.getHeight(context) / 150),
                            width: AppSize.getWidth(context) / 12,
                            height: AppSize.getHeight(context) / 30,
                            child: RotatedBox(
                              quarterTurns: 2,
                              child: SvgPicture.asset(Constants.arrowIcon),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: AppSize.getWidth(context) / 50,
                        ),
                      ],
                    )
                  : Container(),
              showMuzeLogo != null && !showMuzeLogo! ? Container() : Image.asset(Constants.muzeTextLogo, width: AppSize.getWidth(context) / 4.36666),
            ],
          ),
          title != null
              ? Text(
                  title!,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 24),
                )
              : Container(),
          Row(
            children: [
              if (customAppBarType != CustomAppBarType.nothing) ...{
                if (customAppBarType == CustomAppBarType.newsAndChat || customAppBarType == CustomAppBarType.newsChatAndSettings) ...{
                  Bounceable(
                    onTap: onTapNews,
                    child: GifView.asset(Constants.versionProAnimation, width: AppSize.getWidth(context) / 3.2),
                  ),
                  SizedBox(
                    width: AppSize.getWidth(context) / 20,
                  ),
                  Bounceable(
                    onTap: onTapNews,
                    child: SvgPicture.asset(Constants.notificationsIcon, width: AppSize.getWidth(context) / 16.35),
                  ),
                },
                if (customAppBarType == CustomAppBarType.spotifyAndSettings) ...{
                  SizedBox(
                    width: AppSize.getWidth(context) / 18,
                  ),
                  Bounceable(
                    onTap: onTapSpotify,
                    child: Image.asset(Constants.spotifyLogo, width: AppSize.getWidth(context) / 16.35),
                  ),
                },
                if (customAppBarType != CustomAppBarType.newsAndChat) ...{
                  SizedBox(
                    width: AppSize.getWidth(context) / 35,
                  ),
                  Bounceable(
                    onTap: onTapSettings,
                    child: Container(
                      color: Colors.transparent,
                      width: AppSize.getWidth(context) / 10,
                      height: AppSize.getHeight(context) / 30,
                      padding: EdgeInsets.all(AppSize.getWidth(context) / 50),
                      child: SvgPicture.asset(
                        Constants.settingsIcon,
                        width: AppSize.getWidth(context) / 16.35,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                }
              } else ...{
                SizedBox(
                  width: AppSize.getWidth(context) / 12,
                ),
              }
            ],
          ),
        ],
      ),
    );
  }
}
