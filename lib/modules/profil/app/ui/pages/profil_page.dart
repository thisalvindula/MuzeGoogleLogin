import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:muze/core/locator/locator.dart';
import 'package:muze/modules/auth/app/cubits/auth_cubit.dart';
import 'package:muze/modules/profil/app/cubits/profil_cubit.dart';
import 'package:muze/modules/profil/app/cubits/profil_state.dart';
import 'package:muze/modules/profil/app/ui/widgets/profil_information.dart';
import 'package:muze/modules/profil/app/ui/widgets/settings_bottom_dialog.dart';
import 'package:muze/modules/search/app/ui/utils/search_category_type.dart';
import 'package:muze/modules/social/app/cubits/social_cubit.dart';
import 'package:muze/utils/app_size.dart';
import 'package:muze/utils/behavior/custom_behavior.dart';
import 'package:muze/utils/constants/colors.dart';
import 'package:muze/utils/constants/constants.dart';
import 'package:muze/widgets/custom_appbar.dart';
import 'package:muze/widgets/follow_button.dart';
import 'package:muze/widgets/waves.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilPage extends StatefulWidget {
  final bool? isFromHome;
  const ProfilPage({super.key, this.isFromHome});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  String getNumber(int number) {
    String text = "$number";
    if (number >= 1000) {
      text = "${number ~/ 1000}k";
    }
    if (number >= 1000000) {
      text = "${(number / 1000000).toStringAsFixed(2)}M";
    }
    return text;
  }

  @override
  void dispose() {
    locator<ProfilCubit>().clear();
    super.dispose();
  }

  Widget buildPage(BuildContext context) {
    return Column(
      children: [
        widget.isFromHome != null && widget.isFromHome! ? Container() : const Waves(reverse: true),
        CustomAppBar(
          showBackButton: widget.isFromHome != null && widget.isFromHome! ? false : true,
          customAppBarType: locator<ProfilCubit>().state.type == SearchCategoryType.artist ? CustomAppBarType.spotifyAndSettings : CustomAppBarType.settings,
          onTapSpotify: () {
            log("here");
            launchUrl(Uri.parse(locator<ProfilCubit>().state.artist!.external_urls!["spotify"] ?? ""));
          },
          onTapNews: () {},
          onTapSettings: () {
            if (widget.isFromHome != null && widget.isFromHome!) {
              SettingsBottomDialog().show(context);
            }
          },
        ),
        SizedBox(
          height: AppSize.getHeight(context) / 20,
        ),
        BlocBuilder<ProfilCubit, ProfilState>(
          bloc: locator<ProfilCubit>(),
          builder: (context, state) {
            if (state.artist == null && state.user == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSize.getWidth(context) / 20),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Bounceable(
                            onTap: () {},
                            child: const ProfilInformation(profilInformationType: ProfilInformationType.top, value: "0"),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Bounceable(
                            onTap: () {},
                            child: Container(
                              width: AppSize.getWidth(context) / 5,
                              height: AppSize.getHeight(context) / 11,
                              decoration: BoxDecoration(
                                border: state.type == SearchCategoryType.artist ? const Border.fromBorderSide(BorderSide(width: 1, color: AppColors.white)) : null,
                                image: state.type == SearchCategoryType.artist
                                    ? state.artist!.images != null && state.artist!.images!.isNotEmpty
                                        ? state.artist!.images![0].url != null
                                            ? DecorationImage(
                                                image: NetworkImage(
                                                  state.artist!.images![0].url ?? "",
                                                ),
                                              )
                                            : null
                                        : null
                                    : state.user!.user_avatar != null
                                        ? DecorationImage(
                                            image: NetworkImage(
                                              state.user!.user_avatar ?? "",
                                            ),
                                          )
                                        : const DecorationImage(image: AssetImage(Constants.basicUserAvatar)),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Bounceable(
                            onTap: () {},
                            child: ProfilInformation(
                              profilInformationType: state.type == SearchCategoryType.artist ? ProfilInformationType.albums : ProfilInformationType.posts,
                              value: state.type == SearchCategoryType.artist ? state.albums.length.toString() : state.userPosts.length.toString(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: AppSize.getHeight(context) / 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(child: Divider()),
                      SizedBox(
                        width: AppSize.getWidth(context) / 30,
                      ),
                      Text(
                        state.type == SearchCategoryType.artist ? state.artist!.name ?? "" : state.user!.username ?? "",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: AppSize.getWidth(context) / 30,
                      ),
                      const Expanded(child: Divider()),
                    ],
                  ),
                  SizedBox(
                    height: AppSize.getHeight(context) / 30,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSize.getWidth(context) / 20),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Bounceable(
                            onTap: () {
                              //ProfilInformationBottomDialog().show(context);
                            },
                            child: ProfilInformation(
                              profilInformationType: ProfilInformationType.followers,
                              value: getNumber(state.type == SearchCategoryType.artist ? state.artist!.followers!["total"] ?? 0 : state.user!.followers),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: !(widget.isFromHome != null && widget.isFromHome!),
                          child: Align(
                            alignment: Alignment.center,
                            child: FollowButton(
                              follow: state.type == SearchCategoryType.artist
                                  ? state.artist!.is_followed ?? false
                                  : widget.isFromHome != null && widget.isFromHome!
                                      ? false
                                      : state.user!.is_following!,
                              onTap: (value) {
                                if (state.type == SearchCategoryType.artist) {
                                  locator<ProfilCubit>().followArtist();
                                } else {
                                  locator<SocialCubit>().followUser(userId: "${state.user!.id!}", follow: value);
                                }
                              },
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Bounceable(
                            onTap: () {},
                            child: ProfilInformation(
                              profilInformationType: ProfilInformationType.following,
                              value: state.type == SearchCategoryType.artist
                                  ? "0"
                                  : widget.isFromHome != null && widget.isFromHome!
                                      ? locator<AuthCubit>().state.user!.following.toString()
                                      : state.user!.following.toString(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: AppSize.getHeight(context) / 20,
                  ),
                  Center(child: SvgPicture.asset(Constants.iconMenuDotsIcon)),
                  const Divider(color: AppColors.white),
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        if (state.type == SearchCategoryType.artist) {
                          locator<ProfilCubit>().clearAlbums();
                          locator<ProfilCubit>().getAlbums(page: "1");
                        } else {
                          locator<ProfilCubit>().clearUserPosts();
                          locator<ProfilCubit>().getUserPosts();
                        }
                      },
                      child: ScrollConfiguration(
                        behavior: CustomBehavior(),
                        child: state.albums.isNotEmpty || state.userPosts.isNotEmpty
                            ? GridView.builder(
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                                itemCount: state.type == SearchCategoryType.artist ? state.albums.length : state.userPosts.length,
                                padding: const EdgeInsets.all(0),
                                itemBuilder: (context, index) {
                                  return Bounceable(
                                    onTap: () {
                                      if (state.type == SearchCategoryType.artist) {
                                        launchUrl(Uri.parse(state.albums[index].external_urls!["spotify"] ?? ""));
                                      } else {
                                        launchUrl(Uri.parse(state.userPosts[index].spotify_url ?? ""));
                                      }
                                    },
                                    child: Container(
                                      width: AppSize.getWidth(context) / 3,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            state.type == SearchCategoryType.artist ? state.albums[index].images![0].url ?? "" : state.userPosts[index].image_src ?? "",
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              )
                            : const Center(child: CircularProgressIndicator()),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isFromHome != null && widget.isFromHome!) {
      return buildPage(context);
    } else {
      return Scaffold(body: buildPage(context));
    }
  }
}
