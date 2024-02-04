import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:muze/modules/social/data/dtos/likes_dto.dart';
import 'package:muze/modules/social/data/dtos/social_dto.dart';

part 'social_state.freezed.dart';

@freezed
class SocialState with _$SocialState {
  const factory SocialState({
    @Default(true) bool playing,
    @Default(1) int page,
    @Default(true) bool hasMore,
    @Default(false) bool isSuggestion,
    @Default(-1) int indexFirstSuggestionPost,
    @Default(-1) int index,
    @Default([]) List<PostDto> posts,
    LikesDto? likes,
  }) = _SocialState;
}
