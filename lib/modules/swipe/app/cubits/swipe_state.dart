import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:muze/modules/swipe/data/dtos/music_dto.dart';
import 'package:muze/modules/swipe/data/dtos/playlist_dto.dart';

part 'swipe_state.freezed.dart';

@freezed
class SwipeState with _$SwipeState {
  const factory SwipeState({
    @Default([]) List<MusicDto> musics,
    @Default([]) List<List<String>> genres,
    @Default([]) List<String> selectedGenres,
    @Default([]) List<PlaylistDto> playlists,
    @Default(true) bool havePlaylists,
    @Default([]) List<PlaylistDto> selectedPlaylists,
    @Default(true) bool playing,
    @Default(0) int index,
  }) = _SwipeState;
}
