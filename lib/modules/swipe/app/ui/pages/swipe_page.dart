import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:just_audio/just_audio.dart';
import 'package:muze/core/locator/locator.dart';
import 'package:muze/core/router/navigation_helpers.dart';
import 'package:muze/modules/auth/app/cubits/auth_cubit.dart';
import 'package:muze/modules/swipe/app/cubits/swipe_cubit.dart';
import 'package:muze/modules/swipe/app/cubits/swipe_state.dart';
import 'package:muze/modules/swipe/app/ui/utils/swipe_utils.dart';
import 'package:muze/modules/swipe/app/ui/widgets/swipe_buttons.dart';
import 'package:muze/utils/app_size.dart';
import 'package:muze/modules/swipe/app/ui/widgets/swipe_filter.dart';
import 'package:muze/widgets/custom_appbar.dart';
import 'package:muze/widgets/music_card.dart';

class SwipePage extends StatefulWidget {
  const SwipePage({super.key});

  @override
  State<SwipePage> createState() => _SwipePageState();
}

class _SwipePageState extends State<SwipePage> with WidgetsBindingObserver {
  CardSwiperController swipeController = CardSwiperController();
  final AudioPlayer player = AudioPlayer()..setLoopMode(LoopMode.all);
  bool haveMusics = true;
  bool onOtherPage = false;

  Future<bool> swipe(CardSwiperDirection direction) async {
    log("swipeCount : ${locator<SwipeCubit>().state.index}");
    switch (direction) {
      case CardSwiperDirection.left:
        SwipeUtils.onDislike();
        break;
      case CardSwiperDirection.right:
        SwipeUtils.onLike();
        break;
      default:
        break;
    }

    if (locator<SwipeCubit>().state.index >= locator<SwipeCubit>().state.musics.length - 5) {
      getMusic("[only 3 musics left]");
    }
    locator<SwipeCubit>().incrementIndex();
    listenMusic();
    return true;
  }

  void getMusic(String key) async {
    log("get musicssss from $key");
    bool response = await locator<SwipeCubit>().getMusic(genres: locator<SwipeCubit>().state.selectedGenres);
    if (response) {
      haveMusics = true;
      locator<SwipeCubit>().state.index == 0 ? listenMusic() : null;
      log("${locator<SwipeCubit>().state.musics.length}");
      setState(() {});
      if (locator<SwipeCubit>().state.musics.length < 2) {
        getMusic("[musics is empty or less than 2]");
        return;
      }
      if (locator<SwipeCubit>().state.musics.length == locator<SwipeCubit>().state.index) {
        getMusic("[there's no more musics to show]");
        return;
      }
    } else {
      setState(() {
        haveMusics = false;
      });
    }
  }

  void listenMusic() {
    if (locator<SwipeCubit>().state.musics.isNotEmpty) {
      locator<SwipeCubit>().state.musics[locator<SwipeCubit>().state.index].preview_url != null && locator<SwipeCubit>().state.musics[locator<SwipeCubit>().state.index].preview_url!.isNotEmpty
          ? player.setUrl(locator<SwipeCubit>().state.musics[locator<SwipeCubit>().state.index].preview_url ?? "")
          : null;
      locator<SwipeCubit>().state.playing ? player.play() : player.pause();
    } else {
      Timer(const Duration(milliseconds: 500), () {
        listenMusic();
      });
    }
  }

  changePlaying(bool playing) {
    playing ? player.play() : player.pause();
  }

  @override
  void dispose() {
    log("dispose");
    swipeController.dispose();
    player.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      changePlaying(false);
    } else if (state == AppLifecycleState.resumed) {
      if (!onOtherPage) {
        changePlaying(locator<SwipeCubit>().state.playing);
      }
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    if (locator<SwipeCubit>().state.musics.isEmpty) {
      getMusic("[init]");
    } else {
      listenMusic();
    }
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
                changePlaying(locator<SwipeCubit>().state.playing);
                onOtherPage = false;
              },
            );
            onOtherPage = true;
            changePlaying(false);
          },
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 100,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: AppSize.getHeight(context) / 50,
              ),
              SwipeFilter(
                name: locator<AuthCubit>().state.user!.username ?? "",
                callbackChangeFilter: () {
                  changePlaying(false);
                  listenMusic();
                },
              ),
              Flexible(
                child: BlocBuilder<SwipeCubit, SwipeState>(
                  bloc: locator<SwipeCubit>(),
                  builder: (context, state) {
                    return haveMusics
                        ? state.musics.length > 1
                            ? CardSwiper(
                                backCardOffset: const Offset(0, 0),
                                isLoop: false,
                                initialIndex: locator<SwipeCubit>().state.index,
                                controller: swipeController,
                                allowedSwipeDirection: AllowedSwipeDirection.symmetric(horizontal: true, vertical: false),
                                cardBuilder: (context, index, horizontalOffsetPercentage, verticalOffsetPercentage) {
                                  return LayoutBuilder(builder: (context, constraints) {
                                    log("maxHeight : ${constraints.maxHeight}");
                                    log("maxWidth : ${constraints.maxWidth}");
                                    if (constraints.maxHeight > 445) {
                                      return MusicCard(
                                        height: MusicCardHeight.large,
                                        music: state.musics[index],
                                        callbackPlaying: (playing) {
                                          changePlaying(playing);
                                        },
                                      );
                                    } else if (constraints.maxHeight > 300) {
                                      return MusicCard(
                                        height: MusicCardHeight.medium,
                                        music: state.musics[index],
                                        callbackPlaying: (playing) {
                                          changePlaying(playing);
                                        },
                                      );
                                    } else {
                                      return MusicCard(
                                        height: MusicCardHeight.small,
                                        music: state.musics[index],
                                        callbackPlaying: (playing) {
                                          changePlaying(playing);
                                        },
                                      );
                                    }
                                  });
                                },
                                numberOfCardsDisplayed: 2,
                                cardsCount: state.musics.length,
                                onSwipe: (previousIndex, currentIndex, direction) => swipe(direction),
                                duration: const Duration(milliseconds: 400),
                              )
                            : const Center(child: CircularProgressIndicator())
                        : const Center(
                            child: Text(
                              "Aucune musique à afficher.\nRéesayer plus tard.",
                              textAlign: TextAlign.center,
                            ),
                          );
                  },
                ),
              ),
              SwipeButtons(
                onDislike: () {
                  swipeController.swipeLeft();
                },
                onShare: () {
                  SwipeUtils.onShare(context);
                },
                onLike: () {
                  swipeController.swipeRight();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
