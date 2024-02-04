import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muze/app/data/models/api_response.dart';
import 'package:muze/core/locator/locator.dart';
import 'package:muze/modules/auth/app/cubits/auth_cubit.dart';
import 'package:muze/modules/preferences/app/cubits/preferences_state.dart';
import 'package:muze/modules/preferences/data/dtos/artists_dto.dart';
import 'package:muze/modules/preferences/data/dtos/genres_dto.dart';
import 'package:muze/modules/preferences/data/dtos/pagination_dto.dart';
import 'package:muze/modules/preferences/repositories/preferences_domain_repository.dart';
import 'package:muze/utils/string_extension.dart';

enum PreferencesType {
  genres,
  artists,
}

class PreferencesCubit extends Cubit<PreferencesState> {
  final PreferencesDomainRepository preferencesDomainRepository;
  PreferencesCubit({required this.preferencesDomainRepository}) : super(const PreferencesState());

  // PREFERENCES
  Future<List<dynamic>> getPreferences({required PreferencesType type, required String page, String? search, required String key}) async {
    List<List<String>> preferences = [];

    log(key);

    switch (type) {
      case PreferencesType.genres:
        APIResponse response = await preferencesDomainRepository.getGenres(token: locator<AuthCubit>().state.token, page: page, search: search);

        DataGenresDto dataGenresDto = DataGenresDto.fromJson(response.data!);
        PaginationDto paginationDto = dataGenresDto.pagination!;
        List<GenresDto> genresDto = dataGenresDto.content!;

        paginationDto.to == paginationDto.total ? changeHasMore(false) : changeHasMore(true);

        //response.to == responseList.total ? changeHasMore(false) : changeHasMore(true);

        for (GenresDto element in genresDto) {
          preferences.add([element.name ?? "", element.image_url ?? "", "${element.model_id}"]);
        }

        /*if (response.data!.isNotEmpty) {
          for (var element in dataGenresDto.content) {
            if (element["image"] == null) element["image"] = "";
            preferences.add([element["name"], element["image"], "${element["genre_id"]}"]);
          }
        }*/
        break;

      case PreferencesType.artists:
        APIResponse response = await preferencesDomainRepository.getArtists(token: locator<AuthCubit>().state.token, page: page, search: search);

        DataArtistsDto dataArtistsDto = DataArtistsDto.fromJson(response.data!);
        List<ArtistsDto> artistsDto = dataArtistsDto.content!;

        if (!response.success!) {
          changeHasMore(false);
          break;
        }

        if (artistsDto.isEmpty) {
          changeHasMore(false);
          break;
        }

        changeHasMore(true);

        for (ArtistsDto element in artistsDto) {
          ImagesDto image = element.images!.isNotEmpty ? element.images![0] : ImagesDto(url: "");
          preferences.add([element.name ?? "", image.url ?? "", element.id ?? ""]);
        }
        break;
    }

    if (page == "1") {
      clearPreferences();
    }
    addPreferences(preferences);
    return preferences;
  }

  void addPreferences(List<List<String>> newPreferences) {
    List<List<String>> preferences = List.from(state.preferences);
    preferences.addAll(newPreferences);
    emit(state.copyWith(preferences: preferences));
  }

  void clearPreferences() {
    emit(state.copyWith(preferences: []));
  }

  // SELECTED PREFERENCES
  Future<void> getSelectedPreferences({required PreferencesType type}) async {
    APIResponse response = await preferencesDomainRepository.me(token: locator<AuthCubit>().state.token);

    for (var element in (response.data!["content"]["preferences"][type.name.capitalize()] as List)) {
      addSelectedPreferences(element["name"] ?? "");
    }
  }

  Future<bool> editPreferences({required PreferencesType type, required List<String> preferences}) async {
    APIResponse response = await preferencesDomainRepository.editPreferences(token: locator<AuthCubit>().state.token, preferenceName: type.name, preferences: preferences);

    return response.success ?? false;
  }

  void addSelectedPreferences(String selectedPreference) {
    List<String> selectedPreferences = List.from(state.selectedPreferences);
    selectedPreferences.add(selectedPreference);
    emit(state.copyWith(selectedPreferences: selectedPreferences));
  }

  void removeSelectedPreferences(String selectedPreference) {
    List<String> selectedPreferences = List.from(state.selectedPreferences);
    selectedPreferences.remove(selectedPreference);
    emit(state.copyWith(selectedPreferences: selectedPreferences));
  }

  void clearSelectedPreferences() {
    emit(state.copyWith(selectedPreferences: []));
  }

  // SEARCH
  void setSearch(String search) {
    emit(state.copyWith(search: search));
  }

  void clearSearch() {
    emit(state.copyWith(search: ""));
  }

  // PAGE
  void increasePage() {
    emit(state.copyWith(page: state.page + 1));
  }

  void resetPage() {
    emit(state.copyWith(page: 1));
  }

  // HAS MORE
  void changeHasMore(bool hasMore) {
    emit(state.copyWith(hasMore: hasMore));
  }

  // OTHERS
  void clear() {
    clearPreferences();
    clearSearch();
    resetPage();
    clearSelectedPreferences();
  }
}
