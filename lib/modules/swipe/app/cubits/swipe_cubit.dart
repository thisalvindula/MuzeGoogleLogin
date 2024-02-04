import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muze/app/data/models/api_response.dart';
import 'package:muze/core/locator/locator.dart';
import 'package:muze/modules/auth/app/cubits/auth_cubit.dart';
import 'package:muze/modules/preferences/data/dtos/genres_dto.dart';
import 'package:muze/modules/swipe/app/cubits/swipe_state.dart';
import 'package:muze/modules/swipe/data/dtos/music_dto.dart';
import 'package:muze/modules/swipe/data/dtos/playlist_dto.dart';
import 'package:muze/modules/swipe/data/repositories/swipe_repository.dart';
import 'package:muze/modules/swipe/repositories/swipe_domain_repository.dart';
import 'package:muze/utils/thirdparty/spotify/spotify_utils.dart';

enum FiltersType {
  genres,
  mood,
}

class SwipeCubit extends Cubit<SwipeState> {
  final SwipeDomainRepository swipeDomainRepository;
  SwipeCubit({required this.swipeDomainRepository}) : super(const SwipeState());

  // MUSICS
  Future<bool> getMusic({String? artistId, String? trackId, List<String>? genres}) async {
    APIResponse response = await swipeDomainRepository.getMusic(token: locator<AuthCubit>().state.token, artistId: artistId, trackID: trackId, genres: genres);

    if (!response.success!) return false;

    List<MusicDto> musics = List.from(state.musics);

    for (var element in (response.data!["content"] as List)) {
      musics.add(MusicDto.fromJson(element));
    }

    addMusics(musics);

    return true;
  }

  Future<bool> likeMusic({required String musicId, required LikeType type}) async {
    String accessToken = await SpotifyUtils.getAccessToken();
    log("accessToken : $accessToken");

    APIResponse response = await swipeDomainRepository.likeMusic(token: locator<AuthCubit>().state.token, musicId: musicId, type: type, spotifyToken: accessToken);

    return response.success ?? false;
  }

  Future<bool> shareMusic({required String musicId, required String comment}) async {
    APIResponse response = await swipeDomainRepository.shareMusic(token: locator<AuthCubit>().state.token, musicId: musicId, comment: comment);

    return response.success ?? false;
  }

  void addMusics(List<MusicDto> musics) {
    emit(state.copyWith(musics: musics));
  }

  void clearMusics() {
    emit(state.copyWith(musics: []));
  }

  // PLAYING
  void changePlaying(bool playing) {
    emit(state.copyWith(playing: playing));
  }

  // GENRES
  Future<void> getGenres() async {
    APIResponse response = await swipeDomainRepository.getGenres(token: locator<AuthCubit>().state.token);

    DataGenresDto dataGenresDto = DataGenresDto.fromJson(response.data!);
    List<GenresDto> genresDto = dataGenresDto.content!;

    List<List<String>> genres = [];
    //response.to == responseList.total ? changeHasMore(false) : changeHasMore(true);

    for (GenresDto element in genresDto) {
      genres.add([element.name ?? "", element.image_url ?? "", "${element.model_id}"]);
    }

    addGenres(genres);
  }

  void addGenres(List<List<String>> newGenres) {
    List<List<String>> genres = List.from(state.genres);
    genres.addAll(newGenres);
    emit(state.copyWith(genres: genres));
  }

  void clearGenres() {
    emit(state.copyWith(genres: []));
  }

  void setSelectedGenres(List<String> newGenres) {
    List<String> genres = [];
    genres.addAll(newGenres);
    log("a$genres");
    emit(state.copyWith(selectedGenres: genres));
  }

  void clearSelectedGenres() {
    emit(state.copyWith(selectedGenres: []));
  }

  // PLAYLISTS
  Future<void> getPlaylists() async {
    String spotifyToken = await SpotifyUtils.getAccessToken();
    APIResponse response = await swipeDomainRepository.getPlaylists(token: locator<AuthCubit>().state.token, spotifyToken: spotifyToken);

    if (!response.success!) {
      changeHavePlaylists(false);
      return;
    } else {
      changeHavePlaylists(true);
    }

    log("access token : $spotifyToken");
    log("refresh token : ${await SpotifyUtils.getRefreshToken()}");

    List<PlaylistDto> playlists = [];

    log("${response.data!["content"]["tracks"]}");

    if ((response.data!["content"]["tracks"] as List).isEmpty) {
      changeHavePlaylists(false);
    } else {
      changeHavePlaylists(true);
    }

    for (var element in response.data!["content"]["tracks"] as List) {
      if (element["image"].runtimeType != List<dynamic>) {
        playlists.add(PlaylistDto.fromJson(element));
      }
    }

    addPlaylists(playlists);
  }

  void addPlaylists(List<PlaylistDto> newPlaylists) {
    List<PlaylistDto> playlists = List.from(state.playlists);
    playlists.addAll(newPlaylists);
    emit(state.copyWith(playlists: playlists));
  }

  Future<bool> addTrackToPlaylist({required String trackId, required String playlistId}) async {
    String spotifyToken = await SpotifyUtils.getAccessToken();
    APIResponse response = await swipeDomainRepository.addTrackToPlaylist(token: locator<AuthCubit>().state.token, spotifyToken: spotifyToken, trackId: trackId, playlistId: playlistId);

    return response.success ?? false;
  }

  void clearPlaylists() {
    emit(state.copyWith(playlists: []));
  }

  void setSelectedPlaylists(List<PlaylistDto> newPlaylists) {
    List<PlaylistDto> playlists = [];
    playlists.addAll(newPlaylists);
    log("a$playlists");
    emit(state.copyWith(selectedPlaylists: playlists));
  }

  void clearSelectedPlaylists() {
    emit(state.copyWith(selectedPlaylists: []));
  }

  void changeHavePlaylists(bool havePlaylists) {
    emit(state.copyWith(havePlaylists: havePlaylists));
  }

  // INDEX
  void incrementIndex() {
    emit(state.copyWith(index: state.index + 1));
  }

  void clearIndex() {
    emit(state.copyWith(index: 0));
  }
}
