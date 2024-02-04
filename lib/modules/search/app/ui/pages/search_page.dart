import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muze/core/locator/locator.dart';
import 'package:muze/core/router/navigation_helpers.dart';
import 'package:muze/modules/auth/app/cubits/auth_cubit.dart';
import 'package:muze/modules/auth/data/dtos/user_dto.dart';
import 'package:muze/modules/preferences/app/ui/widgets/search_input.dart';
import 'package:muze/modules/profil/data/dtos/artist_dto.dart';
import 'package:muze/modules/search/app/cubits/search_cubit.dart';
import 'package:muze/modules/search/app/cubits/search_state.dart';
import 'package:muze/modules/search/app/ui/utils/search_category_type.dart';
import 'package:muze/modules/search/app/ui/widgets/search_category_button.dart';
import 'package:muze/modules/search/app/ui/widgets/search_row.dart';
import 'package:muze/modules/swipe/data/dtos/music_dto.dart';
import 'package:muze/utils/app_size.dart';
import 'package:muze/utils/behavior/custom_behavior.dart';
import 'package:muze/widgets/custom_appbar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final ScrollController controller = ScrollController();
  Timer? _debounce;

  void _onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(
      const Duration(milliseconds: 500),
      () {
        locator<SearchCubit>().clearPage();
        locator<SearchCubit>().clearResult();
        locator<SearchCubit>().changeHasMore(true);
        locator<SearchCubit>().getResult(page: "1", search: value);
        locator<SearchCubit>().setSearch(value);
      },
    );
  }

  @override
  void initState() {
    locator<SearchCubit>().clearResult();
    locator<SearchCubit>().getResult(page: "1");

    controller.addListener(() {
      if (locator<SearchCubit>().state.hasMore) {
        if (controller.position.maxScrollExtent == controller.offset) {
          log("end scroll");
          if (_debounce?.isActive ?? false) _debounce!.cancel();
          _debounce = Timer(
            const Duration(milliseconds: 500),
            () {
              locator<SearchCubit>().increasePage();
              locator<SearchCubit>().getResult(page: "${locator<SearchCubit>().state.page}");
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
            context.navigator.pushNews();
          },
        ),
        SizedBox(
          height: AppSize.getHeight(context) / 20,
        ),
        SearchInput(
          width: AppSize.getWidth(context) / 1.4,
          onSearchChanged: _onSearchChanged,
        ),
        SizedBox(
          height: AppSize.getHeight(context) / 50,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SearchCategoryButton(type: SearchCategoryType.artist),
            SearchCategoryButton(type: SearchCategoryType.user),
            SearchCategoryButton(type: SearchCategoryType.music),
          ],
        ),
        SizedBox(
          height: AppSize.getHeight(context) / 50,
        ),
        Expanded(
          child: ScrollConfiguration(
            behavior: CustomBehavior(),
            child: BlocBuilder<SearchCubit, SearchState>(
              bloc: locator<SearchCubit>(),
              builder: (context, state) {
                return state.searchDto != null
                    ? ListView.builder(
                        controller: controller,
                        itemCount: locator<SearchCubit>().state.searchDto!.content!.length + 1,
                        itemBuilder: (context, index) {
                          log("$index");
                          log("${locator<SearchCubit>().state.searchDto!.content!.length}");
                          if (index < locator<SearchCubit>().state.searchDto!.content!.length) {
                            SearchRow? searchRow;
                            if (locator<SearchCubit>().state.searchCategoryType == SearchCategoryType.artist) {
                              ArtistDto artist = ArtistDto.fromJson(state.searchDto!.content![index]);

                              searchRow = SearchRow(
                                imageURL: artist.images!.isNotEmpty ? artist.images![0].url ?? "" : "",
                                name: artist.name ?? "",
                                id: artist.id ?? "",
                                type: state.searchCategoryType,
                              );
                            } else if (locator<SearchCubit>().state.searchCategoryType == SearchCategoryType.user) {
                              UserDto user = UserDto.fromJson(state.searchDto!.content![index]);
                              if (user.id != locator<AuthCubit>().state.user!.id) {
                                searchRow = SearchRow(
                                  imageURL: user.user_avatar != null ? user.user_avatar ?? "" : "",
                                  name: user.username ?? "",
                                  id: "${user.id}",
                                  type: state.searchCategoryType,
                                );
                              }
                            } else {
                              MusicDto music = MusicDto.fromJson(state.searchDto!.content![index]);

                              searchRow = SearchRow(
                                imageURL: music.image!.url != null ? music.image!.url ?? "" : "",
                                name: music.name ?? "",
                                id: "${music.track_id}",
                                type: state.searchCategoryType,
                              );
                            }
                            return searchRow != null
                                ? Column(
                                    children: [
                                      searchRow,
                                      SizedBox(
                                        height: AppSize.getHeight(context) / 30,
                                      ),
                                    ],
                                  )
                                : Container();
                          } else {
                            if (state.searchDto!.content!.isEmpty) {
                              return const Center(
                                child: Text("Pas de résultats pour cette recherche."),
                              );
                            } else {
                              return state.hasMore
                                  ? Column(
                                      children: [
                                        const Center(child: CircularProgressIndicator()),
                                        SizedBox(
                                          height: AppSize.getHeight(context) / 50,
                                        ),
                                      ],
                                    )
                                  : Container();
                            }
                          }
                        },
                      )
                    : const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ),
      ],
    );
  }
}
