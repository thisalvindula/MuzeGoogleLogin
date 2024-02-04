import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muze/app/data/models/api_response.dart';
import 'package:muze/core/locator/locator.dart';
import 'package:muze/modules/auth/app/cubits/auth_cubit.dart';
import 'package:muze/modules/auth/data/dtos/user_dto.dart';
import 'package:muze/modules/profil/app/cubits/profil_state.dart';
import 'package:muze/modules/profil/data/dtos/albums_dto.dart';
import 'package:muze/modules/profil/data/dtos/artist_dto.dart';
import 'package:muze/modules/profil/data/dtos/user_post_dto.dart';
import 'package:muze/modules/profil/repositories/profil_domain_repository.dart';
import 'package:muze/modules/search/app/ui/utils/search_category_type.dart';

class ProfilCubit extends Cubit<ProfilState> {
  ProfilDomainRepository profilDomainRepository;
  ProfilCubit({required this.profilDomainRepository}) : super(const ProfilState());

  Future<bool> getFullProfil({required String id, required SearchCategoryType type}) async {
    setId(id);
    changeType(type);
    switch (type) {
      case SearchCategoryType.artist:
        bool responseArtist = await getArtist();
        bool responseAlbums = await getAlbums(page: "1");
        return (responseArtist && responseAlbums);
      case SearchCategoryType.user:
        bool responseUser = await getUser();
        bool responseUserPost = await getUserPosts();
        return (responseUser && responseUserPost);
      case SearchCategoryType.music:
        break;
    }

    return false;
  }

  Future<bool> getArtist() async {
    APIResponse response = await profilDomainRepository.getArtist(token: locator<AuthCubit>().state.token, artistId: state.id);

    if (!response.success!) return false;

    ArtistDto artist = ArtistDto.fromJson(response.data!["content"]);

    setArtist(artist);

    return true;
  }

  Future<bool> followArtist() async {
    APIResponse response = await profilDomainRepository.followArtist(token: locator<AuthCubit>().state.token, artistId: state.id);

    return response.success!;
  }

  void setArtist(ArtistDto artist) {
    emit(state.copyWith(artist: artist));
  }

  void clearArtist() {
    emit(state.copyWith(artist: null));
  }

  void setId(String id) {
    emit(state.copyWith(id: id));
  }

  Future<bool> getAlbums({required String page}) async {
    APIResponse response = await profilDomainRepository.getAlbums(token: locator<AuthCubit>().state.token, artistId: state.id, page: page);

    if (!response.success!) return false;

    List<AlbumDto> albums = [];

    for (var album in response.data!["content"] as List) {
      albums.add(AlbumDto.fromJson(album));
    }

    setAlbums(albums);

    return true;
  }

  void setAlbums(List<AlbumDto> newAlbums) {
    emit(state.copyWith(albums: newAlbums));
  }

  void clearAlbums() {
    emit(state.copyWith(albums: []));
  }

  Future<bool> getUser() async {
    APIResponse response = await profilDomainRepository.getUser(token: locator<AuthCubit>().state.token, userId: state.id);

    if (!response.success!) return false;

    UserDto userDto = UserDto.fromJson(response.data!["content"]);

    setUser(userDto);
    return true;
  }

  void setUser(UserDto user) {
    emit(state.copyWith(user: user));
  }

  void clearUser() {
    emit(state.copyWith(user: null));
  }

  Future<bool> getUserPosts() async {
    APIResponse response = await profilDomainRepository.getUserPosts(token: locator<AuthCubit>().state.token, userId: state.id);

    if (!response.success!) return false;

    List<UserPostDto> userPosts = [];

    for (var userPost in response.data!["content"] as List) {
      userPosts.add(UserPostDto.fromJson(userPost));
    }

    setUserPosts(userPosts);

    return true;
  }

  void setUserPosts(List<UserPostDto> newUserPosts) {
    emit(state.copyWith(userPosts: newUserPosts));
  }

  void clearUserPosts() {
    emit(state.copyWith(userPosts: []));
  }

  void changeType(SearchCategoryType type) {
    emit(state.copyWith(type: type));
  }

  void clear() {
    clearAlbums();
    clearArtist();
    clearUserPosts();
    clearUser();
  }
}
