import 'package:flutter/material.dart';
import 'package:muze/core/locator/locator.dart';
import 'package:muze/core/router/navigation_helpers.dart';
import 'package:muze/l10n/l10n.dart';
import 'package:muze/modules/swipe/app/cubits/swipe_cubit.dart';
import 'package:muze/modules/swipe/app/ui/widgets/filter_row.dart';
import 'package:muze/modules/swipe/app/ui/widgets/genres_row.dart';
import 'package:muze/modules/swipe/app/ui/widgets/playlist_row.dart';
import 'package:muze/modules/swipe/data/dtos/playlist_dto.dart';
import 'package:muze/utils/behavior/custom_behavior.dart';
import 'package:muze/utils/bottom_dialog.dart';

class FilterBottomDialog {
  List<String> selectedGenres = List.from(locator<SwipeCubit>().state.selectedGenres);
  List<PlaylistDto> selectedPlaylists = List.from(locator<SwipeCubit>().state.selectedPlaylists);
  Future<void> show(BuildContext context, {required Function(bool value) callbackFilterOn}) async {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    locator<SwipeCubit>();
    BottomDialog.show(
      context,
      title: localizations.filter_text,
      showButtons: true,
      leftButtonTitle: localizations.cancel_text,
      rightButtonTitle: localizations.confirm_text,
      onRightButtonPressed: () {
        if (selectedGenres.isNotEmpty) {
          locator<SwipeCubit>().setSelectedGenres(selectedGenres);
          locator<SwipeCubit>().clearMusics();
          locator<SwipeCubit>().clearIndex();
          locator<SwipeCubit>().getMusic(genres: locator<SwipeCubit>().state.selectedGenres);
          callbackFilterOn.call(true);
        } else {
          if (locator<SwipeCubit>().state.selectedGenres.isNotEmpty) {
            locator<SwipeCubit>().clearSelectedGenres();
            locator<SwipeCubit>().clearMusics();
            locator<SwipeCubit>().clearIndex();
            locator<SwipeCubit>().getMusic();
            callbackFilterOn.call(false);
          }
        }
        locator<SwipeCubit>().setSelectedPlaylists(selectedPlaylists);
        context.navigator.pop();
      },
      height: MediaQuery.of(context).size.height / 1.2,
      body: Padding(
        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 20),
        child: ScrollConfiguration(
          behavior: CustomBehavior(),
          child: ListView(
            children: [
              GenresRow(
                callback: (name) {
                  if (selectedGenres.contains(name)) {
                    selectedGenres.remove(name);
                    return true;
                  } else {
                    if (selectedGenres.length < 3) {
                      selectedGenres.add(name);
                      return true;
                    }
                  }
                  return false;
                },
              ),
              const FilterRow(),
              PlaylistRow(
                callback: (playlist) {
                  if (playlist.name == "Muze") {
                    return false;
                  }
                  if (selectedPlaylists.any((element) => element.id == playlist.id)) {
                    selectedPlaylists.removeWhere((element) => element.id == playlist.id);
                  } else {
                    selectedPlaylists.add(playlist);
                  }

                  return true;
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
