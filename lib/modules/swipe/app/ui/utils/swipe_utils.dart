import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:muze/core/locator/locator.dart';
import 'package:muze/modules/swipe/app/cubits/swipe_cubit.dart';
import 'package:muze/modules/swipe/app/ui/widgets/share_bottom_dialog.dart';
import 'package:muze/modules/swipe/data/dtos/playlist_dto.dart';
import 'package:muze/modules/swipe/data/repositories/swipe_repository.dart';

class SwipeUtils {
  static void onDislike() {
    log("Dislike music");
    locator<SwipeCubit>().likeMusic(musicId: locator<SwipeCubit>().state.musics[locator<SwipeCubit>().state.index].track_id!, type: LikeType.dislike);
  }

  static void onShare(BuildContext context) {
    log("Share music");
    ShareBottomDialog().show(context, music: locator<SwipeCubit>().state.musics[locator<SwipeCubit>().state.index]);
  }

  static void onLike() {
    log("Like music");
    String trackId = locator<SwipeCubit>().state.musics[locator<SwipeCubit>().state.index].track_id!;
    locator<SwipeCubit>().likeMusic(musicId: trackId, type: LikeType.like);
    addMusicToPlaylists(trackId: trackId);
  }

  static void addMusicToPlaylists({required String trackId}) {
    List<PlaylistDto> playlists = List.from(locator<SwipeCubit>().state.selectedPlaylists);
    for (PlaylistDto playlist in playlists) {
      String playlistId = playlist.id ?? "";
      locator<SwipeCubit>().addTrackToPlaylist(trackId: trackId, playlistId: playlistId);
    }
  }
}
