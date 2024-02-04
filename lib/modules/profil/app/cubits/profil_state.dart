import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:muze/modules/auth/data/dtos/user_dto.dart';
import 'package:muze/modules/profil/data/dtos/albums_dto.dart';
import 'package:muze/modules/profil/data/dtos/artist_dto.dart';
import 'package:muze/modules/profil/data/dtos/user_post_dto.dart';
import 'package:muze/modules/search/app/ui/utils/search_category_type.dart';

part 'profil_state.freezed.dart';

@freezed
class ProfilState with _$ProfilState {
  const factory ProfilState({
    @Default(2) int index,
    @Default([]) List<AlbumDto> albums,
    @Default([]) List<UserPostDto> userPosts,
    @Default("") String id,
    @Default(SearchCategoryType.artist) SearchCategoryType type,
    ArtistDto? artist,
    UserDto? user,
  }) = _ProfilState;
}
