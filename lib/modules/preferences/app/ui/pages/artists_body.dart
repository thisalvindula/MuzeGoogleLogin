import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muze/core/locator/locator.dart';
import 'package:muze/core/router/navigation_helpers.dart';
import 'package:muze/l10n/l10n.dart';
import 'package:muze/modules/auth/app/cubits/auth_cubit.dart';
import 'package:muze/modules/preferences/app/cubits/preferences_cubit.dart';
import 'package:muze/modules/preferences/app/cubits/preferences_state.dart';
import 'package:muze/modules/preferences/app/ui/widgets/next_button.dart';
import 'package:muze/modules/preferences/app/ui/widgets/preferences_icons.dart';
import 'package:muze/modules/preferences/app/ui/widgets/search_input.dart';
import 'package:muze/utils/app_size.dart';
import 'package:muze/utils/behavior/custom_behavior.dart';
import 'package:muze/utils/constants/constants.dart';
import 'package:muze/widgets/custom_snackbar.dart';

class ArtistBody extends StatefulWidget {
  final PageController pageController;
  const ArtistBody({super.key, required this.pageController});

  @override
  State<ArtistBody> createState() => _ArtistBodyState();
}

class _ArtistBodyState extends State<ArtistBody> {
  final ScrollController controller = ScrollController();

  Timer? _debounce;

  void _onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(
      const Duration(milliseconds: 300),
      () {
        locator<PreferencesCubit>().resetPage();
        locator<PreferencesCubit>().getPreferences(type: PreferencesType.artists, page: "1", search: value, key: "search");
        locator<PreferencesCubit>().setSearch(value);
      },
    );
  }

  void _onScrollEnd() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(
      const Duration(milliseconds: 500),
      () {
        locator<PreferencesCubit>().increasePage();
        locator<PreferencesCubit>().getPreferences(
          type: PreferencesType.artists,
          page: "${locator<PreferencesCubit>().state.page}",
          search: locator<PreferencesCubit>().state.search,
          key: "endScroll",
        );
      },
    );
  }

  @override
  void initState() {
    locator<PreferencesCubit>().getPreferences(type: PreferencesType.artists, page: "1", search: locator<PreferencesCubit>().state.search, key: "init");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controller.addListener(() {
      if (locator<PreferencesCubit>().state.hasMore) {
        if (controller.position.maxScrollExtent == controller.offset) {
          _onScrollEnd();
        }
      }
    });
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                locator<PreferencesCubit>().clear();
                widget.pageController.previousPage(duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
              },
              child: SvgPicture.asset(Constants.backButton),
            ),
            Opacity(
              opacity: 0.8,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: localizations.choose_text.toUpperCase(), style: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.w100)),
                    const TextSpan(text: " "),
                    TextSpan(text: localizations.artists_text.toUpperCase(), style: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.w900)),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 15,
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 28,
        ),
        SearchInput(
          width: AppSize.getWidth(context) / 1.8,
          onSearchChanged: _onSearchChanged,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 15,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 2.3,
          child: ScrollConfiguration(
            behavior: CustomBehavior(),
            child: BlocBuilder<PreferencesCubit, PreferencesState>(
              bloc: locator<PreferencesCubit>(),
              builder: (context, state) {
                return ListView.builder(
                  controller: controller,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: (state.preferences.length / 2).round() + 1,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    if (index < state.preferences.length / 2) {
                      return Row(
                        children: [
                          index == 0
                              ? SizedBox(
                                  width: MediaQuery.of(context).size.width / 20,
                                )
                              : Container(),
                          PreferencesIcons(
                            type: PreferecensIconsType.artists,
                            selectedPreferences: state.selectedPreferences,
                            preferences: state.preferences,
                            index: index,
                            showSecondIcon: index * 2 == state.preferences.length - 1 ? false : true,
                          ),
                        ],
                      );
                    } else {
                      if (state.hasMore) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (state.preferences.isEmpty)
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2.2,
                              ),
                            const Center(child: CircularProgressIndicator()),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 10,
                            ),
                          ],
                        );
                      }
                      return Container();
                    }
                  },
                );
              },
            ),
          ),
        ),
        NextButton(
          onTap: () async {
            if (locator<PreferencesCubit>().state.selectedPreferences.isEmpty) {
              CustomSnackBar(context, text: localizations.artists_need_error_text);
            } else {
              log("${locator<PreferencesCubit>().state.selectedPreferences}");
              bool response = await locator<PreferencesCubit>().editPreferences(preferences: locator<PreferencesCubit>().state.selectedPreferences, type: PreferencesType.artists);
              if (response) {
                locator<PreferencesCubit>().clear();
                await locator<AuthCubit>().userInfo();
                if (context.mounted) {
                  context.navigator.pushHome();
                }
              } else {
                if (context.mounted) {
                  CustomSnackBar(context, text: localizations.error_try_again_later);
                }
              }
            }
          },
        ),
      ],
    );
  }
}
