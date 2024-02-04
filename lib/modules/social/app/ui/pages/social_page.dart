import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inview_notifier_list/inview_notifier_list.dart';
import 'package:just_audio/just_audio.dart';
import 'package:muze/core/locator/locator.dart';
import 'package:muze/core/router/navigation_helpers.dart';
import 'package:muze/modules/social/app/cubits/social_cubit.dart';
import 'package:muze/modules/social/app/cubits/social_state.dart';
import 'package:muze/modules/social/app/ui/widgets/social_post.dart';
import 'package:muze/utils/app_size.dart';
import 'package:muze/utils/behavior/custom_behavior.dart';
import 'package:muze/widgets/custom_appbar.dart';

class SocialPage extends StatefulWidget {
  const SocialPage({super.key});

  @override
  State<SocialPage> createState() => _SocialPageState();
}

class _SocialPageState extends State<SocialPage> with WidgetsBindingObserver {
  final ScrollController controller = ScrollController();
  Timer? _debounce;
  final AudioPlayer player = AudioPlayer()..setLoopMode(LoopMode.all);
  bool isFirstSuggestionPost = false;

  void listenMusic(int newIndex) {
    int index = locator<SocialCubit>().state.index;
    if (newIndex != index) {
      locator<SocialCubit>().changeIndex(newIndex);
      player.setUrl(locator<SocialCubit>().state.posts[newIndex].preview_url ?? "");
      locator<SocialCubit>().state.playing ? player.play() : player.pause();
    }
  }

  void changePlaying(bool playing) {
    playing ? player.play() : player.pause();
  }

  void controllerGoUp() {
    log("here in function");
    controller.animateTo(0, duration: const Duration(milliseconds: 800), curve: Curves.decelerate);
  }

  @override
  void dispose() {
    player.dispose();
    locator<SocialCubit>().changeIndex(-1);
    locator<SocialCubit>().resetPage();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      changePlaying(false);
    } else if (state == AppLifecycleState.resumed) {
      changePlaying(locator<SocialCubit>().state.playing);
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    locator<SocialCubit>().clearPosts();
    locator<SocialCubit>().getPosts(page: "1");

    controller.addListener(() {
      if (locator<SocialCubit>().state.hasMore) {
        if (controller.position.maxScrollExtent == controller.offset) {
          log("end scroll");
          log("current page : ${locator<SocialCubit>().state.page}");
          if (_debounce?.isActive ?? false) _debounce!.cancel();
          _debounce = Timer(
            const Duration(milliseconds: 300),
            () {
              locator<SocialCubit>().increasePage();
              log("next page : ${locator<SocialCubit>().state.page}");
              locator<SocialCubit>().getPosts(page: "${locator<SocialCubit>().state.page}");
            },
          );
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          customAppBarType: CustomAppBarType.newsAndChat,
          onTapNews: () {
            context.navigator.pushNews(
              callback: () {
                changePlaying(locator<SocialCubit>().state.playing);
              },
            );
            changePlaying(false);
          },
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 100,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: ScrollConfiguration(
                  behavior: CustomBehavior(),
                  child: BlocBuilder<SocialCubit, SocialState>(
                    bloc: locator<SocialCubit>(),
                    builder: (context, state) {
                      return RefreshIndicator(
                        onRefresh: () async {
                          locator<SocialCubit>().resetPage();
                          locator<SocialCubit>().clearPosts();
                          locator<SocialCubit>().getPosts(page: "1");
                        },
                        child: state.posts.isNotEmpty
                            ? InViewNotifierList(
                                padding: EdgeInsets.zero,
                                initialInViewIds: const ["0"],
                                isInViewPortCondition: (deltaTop, deltaBottom, viewPortDimension) {
                                  return deltaTop < (0.5 * viewPortDimension) && deltaBottom > (0.5 * viewPortDimension);
                                },
                                controller: controller,
                                itemCount: locator<SocialCubit>().state.posts.length + 1,
                                builder: (context, index) {
                                  return index < locator<SocialCubit>().state.posts.length
                                      ? Column(
                                          children: [
                                            if (isFirstSuggestionPost) ...{
                                              const Text("Suggestion"),
                                            },
                                            InViewNotifierWidget(
                                              id: "$index",
                                              builder: (context, isInView, child) {
                                                if (isInView) {
                                                  listenMusic(index);
                                                }
                                                return SocialPost(
                                                  post: locator<SocialCubit>().state.posts[index],
                                                  callbackPlaying: (playing) {
                                                    changePlaying(playing);
                                                  },
                                                  callbackOnTapFollowButton: (value) {
                                                    locator<SocialCubit>().followUser(userId: "${locator<SocialCubit>().state.posts[index].user!.id!}", follow: value);
                                                  },
                                                );
                                              },
                                            ),
                                          ],
                                        )
                                      : state.hasMore
                                          ? Center(
                                              child: Column(
                                                children: [
                                                  const CircularProgressIndicator(),
                                                  SizedBox(
                                                    height: AppSize.getHeight(context) / 50,
                                                  ),
                                                ],
                                              ),
                                            )
                                          : Container();
                                },
                              )
                            : const Center(child: CircularProgressIndicator()),
                      );
                    },
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
