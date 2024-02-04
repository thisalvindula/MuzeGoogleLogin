// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profil_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProfilState {
  int get index => throw _privateConstructorUsedError;
  List<AlbumDto> get albums => throw _privateConstructorUsedError;
  List<UserPostDto> get userPosts => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  SearchCategoryType get type => throw _privateConstructorUsedError;
  ArtistDto? get artist => throw _privateConstructorUsedError;
  UserDto? get user => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfilStateCopyWith<ProfilState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfilStateCopyWith<$Res> {
  factory $ProfilStateCopyWith(
          ProfilState value, $Res Function(ProfilState) then) =
      _$ProfilStateCopyWithImpl<$Res, ProfilState>;
  @useResult
  $Res call(
      {int index,
      List<AlbumDto> albums,
      List<UserPostDto> userPosts,
      String id,
      SearchCategoryType type,
      ArtistDto? artist,
      UserDto? user});
}

/// @nodoc
class _$ProfilStateCopyWithImpl<$Res, $Val extends ProfilState>
    implements $ProfilStateCopyWith<$Res> {
  _$ProfilStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? albums = null,
    Object? userPosts = null,
    Object? id = null,
    Object? type = null,
    Object? artist = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      albums: null == albums
          ? _value.albums
          : albums // ignore: cast_nullable_to_non_nullable
              as List<AlbumDto>,
      userPosts: null == userPosts
          ? _value.userPosts
          : userPosts // ignore: cast_nullable_to_non_nullable
              as List<UserPostDto>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SearchCategoryType,
      artist: freezed == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as ArtistDto?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDto?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfilStateImplCopyWith<$Res>
    implements $ProfilStateCopyWith<$Res> {
  factory _$$ProfilStateImplCopyWith(
          _$ProfilStateImpl value, $Res Function(_$ProfilStateImpl) then) =
      __$$ProfilStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int index,
      List<AlbumDto> albums,
      List<UserPostDto> userPosts,
      String id,
      SearchCategoryType type,
      ArtistDto? artist,
      UserDto? user});
}

/// @nodoc
class __$$ProfilStateImplCopyWithImpl<$Res>
    extends _$ProfilStateCopyWithImpl<$Res, _$ProfilStateImpl>
    implements _$$ProfilStateImplCopyWith<$Res> {
  __$$ProfilStateImplCopyWithImpl(
      _$ProfilStateImpl _value, $Res Function(_$ProfilStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? albums = null,
    Object? userPosts = null,
    Object? id = null,
    Object? type = null,
    Object? artist = freezed,
    Object? user = freezed,
  }) {
    return _then(_$ProfilStateImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      albums: null == albums
          ? _value._albums
          : albums // ignore: cast_nullable_to_non_nullable
              as List<AlbumDto>,
      userPosts: null == userPosts
          ? _value._userPosts
          : userPosts // ignore: cast_nullable_to_non_nullable
              as List<UserPostDto>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SearchCategoryType,
      artist: freezed == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as ArtistDto?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDto?,
    ));
  }
}

/// @nodoc

class _$ProfilStateImpl implements _ProfilState {
  const _$ProfilStateImpl(
      {this.index = 2,
      final List<AlbumDto> albums = const [],
      final List<UserPostDto> userPosts = const [],
      this.id = "",
      this.type = SearchCategoryType.artist,
      this.artist,
      this.user})
      : _albums = albums,
        _userPosts = userPosts;

  @override
  @JsonKey()
  final int index;
  final List<AlbumDto> _albums;
  @override
  @JsonKey()
  List<AlbumDto> get albums {
    if (_albums is EqualUnmodifiableListView) return _albums;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_albums);
  }

  final List<UserPostDto> _userPosts;
  @override
  @JsonKey()
  List<UserPostDto> get userPosts {
    if (_userPosts is EqualUnmodifiableListView) return _userPosts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userPosts);
  }

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final SearchCategoryType type;
  @override
  final ArtistDto? artist;
  @override
  final UserDto? user;

  @override
  String toString() {
    return 'ProfilState(index: $index, albums: $albums, userPosts: $userPosts, id: $id, type: $type, artist: $artist, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfilStateImpl &&
            (identical(other.index, index) || other.index == index) &&
            const DeepCollectionEquality().equals(other._albums, _albums) &&
            const DeepCollectionEquality()
                .equals(other._userPosts, _userPosts) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.artist, artist) || other.artist == artist) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      index,
      const DeepCollectionEquality().hash(_albums),
      const DeepCollectionEquality().hash(_userPosts),
      id,
      type,
      artist,
      user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfilStateImplCopyWith<_$ProfilStateImpl> get copyWith =>
      __$$ProfilStateImplCopyWithImpl<_$ProfilStateImpl>(this, _$identity);
}

abstract class _ProfilState implements ProfilState {
  const factory _ProfilState(
      {final int index,
      final List<AlbumDto> albums,
      final List<UserPostDto> userPosts,
      final String id,
      final SearchCategoryType type,
      final ArtistDto? artist,
      final UserDto? user}) = _$ProfilStateImpl;

  @override
  int get index;
  @override
  List<AlbumDto> get albums;
  @override
  List<UserPostDto> get userPosts;
  @override
  String get id;
  @override
  SearchCategoryType get type;
  @override
  ArtistDto? get artist;
  @override
  UserDto? get user;
  @override
  @JsonKey(ignore: true)
  _$$ProfilStateImplCopyWith<_$ProfilStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
