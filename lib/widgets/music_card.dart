import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:muze/core/locator/locator.dart';
import 'package:muze/core/router/navigation_helpers.dart';
import 'package:muze/modules/profil/app/cubits/profil_cubit.dart';
import 'package:muze/modules/search/app/ui/utils/search_category_type.dart';
import 'package:muze/modules/social/app/cubits/social_cubit.dart';
import 'package:muze/modules/social/data/dtos/social_dto.dart';
import 'package:muze/modules/swipe/app/cubits/swipe_cubit.dart';
import 'package:muze/modules/swipe/data/dtos/music_dto.dart';
import 'package:muze/utils/app_size.dart';
import 'package:muze/utils/constants/colors.dart';
import 'package:muze/utils/constants/constants.dart';
import 'package:url_launcher/url_launcher.dart';

enum MusicCardHeight {
  small,
  medium,
  large,
}

class MusicCard extends StatelessWidget {
  final MusicDto? music;
  final PostDto? post;
  final Function(bool playing) callbackPlaying;
  final MusicCardHeight height;
  const MusicCard({super.key, this.music, this.post, required this.callbackPlaying, required this.height}) : assert(music != null || post != null);

  double getHeight(BuildContext context, MusicCardHeight height) {
    switch (height) {
      case MusicCardHeight.small:
        return AppSize.getHeight(context) / 8;
      case MusicCardHeight.medium:
        return AppSize.getHeight(context) / 40;
      case MusicCardHeight.large:
        return AppSize.getHeight(context) / 150;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getHeight(context, height)),
      child: Column(
        children: [
          Container(
            height: height != MusicCardHeight.small ? AppSize.getHeight(context) / 14 : AppSize.getHeight(context) / 12,
            width: double.infinity,
            decoration: const BoxDecoration(color: AppColors.grey, borderRadius: BorderRadius.vertical(top: Radius.circular(35))),
            child: Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 100),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSize.getWidth(context) / 15),
                    child: Text(
                      music != null ? music!.name ?? "" : post!.title ?? "",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: AppSize.getWidth(context) / 27, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Text(
                    music != null ? music!.artists![0].name ?? "" : post!.artists![0].name ?? "",
                    style: TextStyle(fontSize: AppSize.getWidth(context) / 32, color: AppColors.greyText, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              callbackPlaying(!locator<SwipeCubit>().state.playing);
              locator<SwipeCubit>().state.playing
                  ? {locator<SwipeCubit>().changePlaying(false), locator<SocialCubit>().changePlaying(false)}
                  : {locator<SwipeCubit>().changePlaying(true), locator<SocialCubit>().changePlaying(true)};
            },
            child: CachedNetworkImage(
              imageUrl: music != null ? music!.image!.url! : post!.image!.url!,
              fadeInDuration: Duration.zero,
              fadeOutDuration: Duration.zero,
              placeholderFadeInDuration: Duration.zero,
              progressIndicatorBuilder: (context, url, progress) => Container(
                color: AppColors.backgroundBlack,
                padding: EdgeInsets.all(AppSize.getWidth(context) / 3.5),
                child: LottieBuilder.asset(Constants.loadingAnimation),
              ),
            ),
          ),
          Container(
            height: AppSize.getHeight(context) / 14,
            decoration: const BoxDecoration(color: AppColors.grey, borderRadius: BorderRadius.vertical(bottom: Radius.circular(35))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    String? url = music != null ? music!.spotify_url : post!.spotify_url;
                    launchUrl(Uri.parse(url!));
                  },
                  child: Container(
                    color: Colors.transparent,
                    width: AppSize.getWidth(context) / 10,
                    child: Padding(
                      padding: EdgeInsets.all(MediaQuery.of(context).size.width / 60),
                      child: Image.asset(
                        Constants.spotifyLogo,
                        width: MediaQuery.of(context).size.width / 15,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    callbackPlaying(!locator<SwipeCubit>().state.playing);
                    locator<SwipeCubit>().state.playing
                        ? {locator<SwipeCubit>().changePlaying(false), locator<SocialCubit>().changePlaying(false)}
                        : {locator<SwipeCubit>().changePlaying(true), locator<SocialCubit>().changePlaying(true)};
                  },
                  child: SvgPicture.asset(
                    locator<SwipeCubit>().state.playing ? Constants.pauseIcon : Constants.playIcon,
                  ),
                ),
                Bounceable(
                  onTap: () async {
                    String? id = music != null ? music!.artists![0].model_id : post!.artists![0].model_id;
                    context.navigator.pushProfil();
                    bool response = await locator<ProfilCubit>().getFullProfil(id: id!, type: SearchCategoryType.artist);
                    if (!response && context.mounted) {
                      context.navigator.pop();
                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 11,
                    height: MediaQuery.of(context).size.height / 20,
                    decoration: BoxDecoration(
                      image: music != null
                          ? music!.artists != null && music!.artists![0].image_url != null
                              ? DecorationImage(image: NetworkImage(music!.artists![0].image_url ?? ""), fit: BoxFit.scaleDown)
                              : null
                          : post!.artists != null && post!.artists![0].image_url != null
                              ? DecorationImage(image: NetworkImage(post!.artists![0].image_url ?? ""), fit: BoxFit.scaleDown)
                              : null,
                      border: Border.fromBorderSide(
                        BorderSide(
                          width: 1,
                          color: AppColors.white.withOpacity(0.5),
                        ),
                      ),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
